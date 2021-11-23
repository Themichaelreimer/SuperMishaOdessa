function getVectorBetweenBodies(b1, b2)
	local p1x, p1y = b1:getPosition()
	local p2x, p2y = b2:getPosition()
	local dx = p2x - p1x
	local dy = p2y - p1y

	local r = math.sqrt(dx * dx + dy * dy)
	return {
		x = dx / r,
		y = dy / r
	}
end
