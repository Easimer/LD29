require("/lib/class")
require("/lib/simpletools")
require("/lib/loveframes")
player2 = class:new()

player2.position = {}
player2.position.X = 256
player2.position.Y = 720/2

player2.dead = false

--percent
player2.oxigenlevel = 100

player2.rotation = 0

player2.lifetime = 0

player2.health = 100

player2.healthbar = loveframes.Create("progressbar")

player2.number = 1

player2.set = function(self, number)
	self.number = number
	player2.position.X = 128
	self.image = love.graphics.newImage ("/data/player/player2.png")
end

player2.load = function(self)
end

player2.kill = function(self)
end

player2.move = function(self, direction)
	if not self.dead then
		self.state = "moving"
		if direction == "left" then
			self.position.X = self.position.X - 1
		elseif direction == "right" then
			self.position.X = self.position.X + 1
		end
	end
end

player2.update = function(self, dt)
		self.healthbar:SetPos(self.position.X, self.position.Y+self.image:getHeight()+10)
		self.healthbar:SetWidth(self.image:getWidth())
		self.healthbar:SetMax(100)
		self.healthbar:SetValue(self.health)
		self.healthbar:SetText(self.health .. "%")
		if love.keyboard.isDown("left") and self.number == 2 then
			self:move("left")
		end
		if love.keyboard.isDown("right") and self.number == 2 then
			self:move("right")
		end
end

player2.keyreleased = function (self, key)
	self.state = "idle"
end

player2.draw = function(self)
	love.graphics.draw(self.image, self.position.X, self.position.Y, self.rotation)
end

player2.switch = function(self, player1)
	
end