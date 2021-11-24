function getVectorBetweenBodies(b1, b2, normalize)
	local shouldNormalize = normalize or false
	local p1x, p1y = b1:getPosition()
	local p2x, p2y = b2:getPosition()
	local dx = p2x - p1x
	local dy = p2y - p1y

	local r = math.sqrt(dx * dx + dy * dy)
	if shouldNormalize then
		return {
			x = dx / r,
			y = dy / r,
			r = r
		}
	else
		return {
			x = dx,
			y = dy,
			r = r
		}
	end
end
