local Camera = class('Camera')

Camera.speedMult = 10.0
Camera.snapDist = 0.0

function Camera:init(x, y)
	self.body = love.physics.newBody(physicsWorld, x, y, "dynamic")
end

function Camera:update(dt)
	if not player then return end
	local r = getVectorBetweenBodies(self.body, player.collider.body)
	if r.r < self.snapDist then
		self.body:setPosition(player.collider.body:getPosition())
		self.body:setLinearVelocity(0, 0)
	else
		self.body:setLinearVelocity(r.x * self.speedMult, r.y * self.speedMult)
	end
end

return Camera
