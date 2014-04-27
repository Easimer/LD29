require("player1")
require("player2")
require("background")
require("/lib/loveframes")
require("onscreenkey")
require("walker")

local player1 = player1:new()
local player2 = player2:new()
local background = background:new()

local t = 0

local score = 0

local music = nil

local currentwhitemonster
local currentblackmonster

local keya = onscreenkey:new()
keya:setKey("A")
keya:setSkin("white")
local keyd = onscreenkey:new()
keyd:setKey("D")
keyd:setSkin("white")
local keyleft = onscreenkey:new()
keyleft:setKey("Arrow_Left")
keyleft:setSkin("black")
local keyright = onscreenkey:new()
keyright:setKey("Arrow_Right")
keyright:setSkin("black")
local keyspace = onscreenkey:new()
keyspace:setKey("Space")
keyspace:setSkin("uni")
local keylctrl = onscreenkey:new()
keylctrl:setKey("Ctrl")
keylctrl:setSkin("white")
local keyrctrl = onscreenkey:new()
keyrctrl:setKey("Ctrl")
keyrctrl:setSkin("black")


function switchPlayer()
	
end

function drawKeyPrompt()
	if t < 15 then
		keya:draw(1280/2, 100)
		keyd:draw(1280/2+110, 100)
		keylctrl:draw(1280/2+110+110, 100)
		keyleft:draw(1280/2, 600)
		keyright:draw(1280/2+110, 600)
		keyrctrl:draw(1280/2+110+110, 600)
		keyspace:draw(1280/2+110, 720/2-50)
	end
end

function love.load()
	music = love.audio.newSource("/data/music/Heart of Machine.mp3", "static")
	music:setLooping(true)
	--love.audio.play(music)
	player1:set(1)
	player2:set(2)

end

function love.update(dt)
	t = t + dt
	player1:update(dt)
	player2:update(dt)
	loveframes.update(dt)
	if not currentblackmonster == nil then
		if math.random() > 0.5 then
			currentwhitemonster = walker:new()
			player1.target = currentwhitemonster
		end
	end
end

function love.draw()
	--Draw background
	background:draw()
	love.graphics.line(0, 720/2, 1280, 720/2)
	player1:draw()
	player2:draw()
	loveframes.draw()
	drawKeyPrompt()
	love.graphics.print("Score: " .. score, 10, 10)
	if love.web then
		love.graphics.print("Löve WebPlayer", 10, 30)
	end
end

function love.keypressed(key, isrepeat)

end