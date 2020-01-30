local M = {}

M.STATE_MENU = 1
M.STATE_CONTROLS = 2
M.STATE_GETREADY = 3
M.STATE_PLAYING = 4
M.STATE_LEVELCLEAR = 5
M.STATE_GAMEOVER = 6

M.state = M.STATE_MENU

M.TILE_SIZE = 16
M.PIXEL_SIZE = 4
M.SCREEN_W = 320
M.SCREEN_H = 180

M.level = 1
M.maxlevel = 1
M.lives = 3
M.fuel = 100
M.score = 0
M.hiscore = 0
M.bosses = 0

M.scrollpos = vmath.vector3(0,0,0)
M.playerpos = vmath.vector3(0,0,0)
M.spawnpos = vmath.vector3(0,0,0)

function M.world2tile(p)
	return vmath.vector3(math.floor((p.x + M.TILE_SIZE) / M.TILE_SIZE), math.floor((p.y + M.TILE_SIZE) / M.TILE_SIZE), p.z)
end

function M.tile2world(p)
	return vmath.vector3((p.x * M.TILE_SIZE) - (M.TILE_SIZE / 2), (p.y * M.TILE_SIZE) - (M.TILE_SIZE / 2), p.z)
end

function M.onscreen(p, m)
	if p.x > M.scrollpos.x - m and
	p.x < M.scrollpos.x + m + M.SCREEN_W and
	p.y > M.scrollpos.y - m and
	p.y < M.scrollpos.y + m + M.SCREEN_H then
		return true
	else
		return false
	end
end

return M