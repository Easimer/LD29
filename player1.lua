require("lib/class")
require("lib/simpletools")
require("lib/loveframes")
player1 = class:new()

player1.position = {}
player1.position.X = 256
player1.position.Y = 720/2

player1.health = 100

player1.dead = false

--percent
player1.oxigenlevel = 100

player1.healthbar = loveframes.Create("progressbar")


player1.rotation = 0

player1.lifetime = 0

player1.target = nil

player1.shootinglazor = false

player1.number = 1

player1.set = function(self, number)
	self.number = number
	self.image = love.graphics.newImage ("data/player/player1.png")
	self.rotation=math.pi
end

player1.load = function(self)
end

player1.kill = function(self)
end

player1.move = function(self, direction)
	if not self.dead then
		self.state = "moving"
		if direction == "left" then
			self.position.X = self.position.X - 1
		elseif direction == "right" then
			self.position.X = self.position.X + 1
		end
	end
end

player1.update = function(self, dt)
		self.healthbar:SetPos(self.position.X - self.image:getHeight()/2, self.position.Y-self.image:getHeight()+10)
		self.healthbar:SetWidth(self.image:getWidth())
		self.healthbar:SetMax(100)
		self.healthbar:SetValue(self.health)
		self.healthbar:SetText(self.health .. "%")
		if love.keyboard.isDown("a") then
			self:move("left")
		elseif love.keyboard.isDown("d") then
			self:move("right")
		elseif love.keyboard.isDown("lctrl") then
			self.shootinglazor = true
		else
			self.shootinglazor = false
		end
end

player1.keyreleased = function (self, key)
	self.state = "idle"
end

player1.draw = function(self)
	love.graphics.draw(self.image, self.position.X, self.position.Y, self.rotation)
end

player1.switch = function(self, player2)
	
end

player1.drawl = function(self)
love.graphics.line(self.position.X, self.position.Y, self.target.position.X, self.target.position.Y)
end

player1.shoot = function(self)
	love.graphics.setColor(255, 255, 255, 255)
	pcall(self:drawl())
end
