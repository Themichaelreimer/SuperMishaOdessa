local PlayerControlSystem = tiny.processingSystem(class "PlayerControlSystem")
PlayerControlSystem.filter = tiny.requireAll('playerController', 'collider')

function PlayerControlSystem:process(entity, dt)
	if not entity.deleted then
		local dx = 0
		local dy = 0

		if love.keyboard.isDown('left') then
			dx = -entity.moveForce
		elseif love.keyboard.isDown('right') then
			dx = entity.moveForce
		end

		if love.keyboard.isDown('down') then
			dy = entity.moveForce
		end
		
		entity.collider.body:applyForce(dx, dy)
	end
end

return PlayerControlSystem
