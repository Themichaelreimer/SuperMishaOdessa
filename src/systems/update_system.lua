local UpdateSystem = tiny.processingSystem(class "UpdateSystem")
UpdateSystem.filter = tiny.requireAll('update')

function UpdateSystem:process(entity, dt)
	if not entity.deleted then
		entity:update(dt)
	end
end

return UpdateSystem
