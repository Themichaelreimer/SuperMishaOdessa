class = require("lib.30log")
tiny = require("lib.tiny")
ldtk = require("lib.ldtk")
require('src.helpers')
require('src.ecs')

screen = {
	tileSize = 16,
	pixelWidth = love.graphics.getWidth(),
	pixelHeight = love.graphics.getHeight(),
}
layers = {}

debugRender = true

gameState = {}

Player = require('src.entities.player')
Camera = require('src.entities.camera')

function love.load()

	love.window.setTitle("Super Misha Odessa")
	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.graphics.setLineStyle('rough')

	physicsWorld = love.physics.newWorld(0, 0, true)
	physicsWorld:setCallbacks(beginContact, endContact)
	level = ldtk:load("assets/tilemaps/world.ldtk")

	-- CALLBACKS
	function ldtk.entity(ent)
		print(ent)
	end

	function ldtk.layer(layer)
		-- Use layer:draw() to draw
		table.insert(layers, layer)
	end

	function ldtk.onLevelLoad(level)
		print('onLevelLoad')
	end

	function ldtk.onLevelCreated(level)
		print('onLevelCreated')
	end

	ldtk:goTo(1)
	
	player = Player(16,16)
	camera = Camera(0,0)
	create(player)
	create(camera)
end

function love.update(dt)
	physicsWorld:update(dt)
end

function love.draw()
	love.graphics.scale(2,2)
	if camera then
		local tx = camera.body:getX()
		local ty = camera.body:getY()
		love.graphics.translate(-tx + screen.pixelWidth/4, -ty + screen.pixelHeight/4)
	end

	for _, layer in ipairs(layers) do
		layer:draw()
	end
	local dt = love.timer.getDelta()
	if ecsWorld then ecsWorld:update(dt) end

end

function beginContact(fixture1, fixture2, contact)
	local obj1 = fixture1:getUserData()
	local obj2 = fixture2:getUserData()
	if not (obj1 and obj2) then return end

	if obj1.beginContact then obj1:beginContact(obj2) end
	if obj2.beginContact then obj2:beginContact(obj1) end
end

function endContact(fixture1, fixture2, contact)
        local obj1 = fixture1:getUserData()
        local obj2 = fixture2:getUserData()
        if not (obj1 and obj2) then return end

        if obj1.endContact then obj1:endContact(obj2) end
        if obj2.endContact then obj2:endContact(obj1) end
end

