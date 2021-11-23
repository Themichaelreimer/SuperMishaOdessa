local Player = class("Player")
local BoxBody = require("src.components.box_body")

Player.size = screen.tileSize
Player.debugColour = {1.0,0.0,0.0}
Player.playerController = true
Player.moveForce = 75
Player.jumpImpulse = 25

function Player:init(x, y)
	self.collider = BoxBody({
		x = x,
		y = y,
		width = self.size,
		height = self.size,	 
	}, self)

	assert(self.collider.body)
end

function Player:destroy()
	self.deleted = true
	self.collider:destroy()
end


return Player
