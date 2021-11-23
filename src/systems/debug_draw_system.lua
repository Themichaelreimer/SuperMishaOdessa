local DebugDrawSystem = tiny.processingSystem(class "DebugDrawSystem")
DebugDrawSystem.filter = tiny.requireAll('collider')

function DebugDrawSystem:process(entity, dt)
	if debugRender and not entity.deleted then
		if entity.debugColour then
			love.graphics.setColor(entity.debugColour)
		end
		local collider = entity.collider
		love.graphics.polygon("fill", collider.body:getWorldPoints(collider.shape:getPoints()))
		love.graphics.setColor(1,1,1)

	end
end

return DebugDrawSystem
