PlayerControlSystem = require("src.systems.player_control_system")
DebugDrawSystem = require("src.systems.debug_draw_system")
UpdateSystem = require("src.systems.update_system")

ecsWorld = tiny.world(PlayerControlSystem, DebugDrawSystem, UpdateSystem)
gameObjects = {}

function create(entity)
	ecsWorld:add(entity)
	table.insert(gameObjects, entity)
end
