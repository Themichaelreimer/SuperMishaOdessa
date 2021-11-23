local Camera = class('Camera')

Camera.speedMult = 100.0

function Camera:init(x, y)
	self.body = love.physics.newBody(physicsWorld, x, y, "dynamic")
end

function Camera:update(dt)
	if not player then return end
	local r = getVectorBetweenBodies(self.body, player.collider.body)
	self.body:setLinearVelocity(r.x * self.speedMult, r.y * self.speedMult)
end

return Camera
