local BoxBody = class("BoxBody")

function BoxBody:init(params, this)
	local x = params.x or 0
	local y = params.y or 0
	local width = params.width or screen.tileWidth
	local height = params.height or screen.tileHeight
	local isSensor = params.isSensor or false
	local ld = params.ld or 5
	
	self.body = love.physics.newBody(physicsWorld, x, y, "dynamic")
	self.shape = love.physics.newRectangleShape(width, height)
	self.fixture = love.physics.newFixture(self.body, self.shape)

	if isSensor then self.fixture.setSensor(true) end
	self.body:setLinearDamping(ld)

	self.fixture:setUserData(this)
end

function BoxBody:destroy()
	self.deleted = true
	self.fixture:destroy()
	self.body:destroy()	
end

return BoxBody
