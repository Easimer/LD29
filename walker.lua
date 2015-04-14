require("monsterbase")

walker = monsterbase:new()

walker.setImage = function(self, color)
	self.color = color
	if color == "black" then
    	self.image = love.graphics.newImage("data/monsters/walker_black.png")
    	self.flip = true
	elseif color == "white" then
		self.image = love.graphics.newImage("data/monsters/walker_white.png")

	end
end



walker.draw = function(self)
	if self.flip then
		love.graphics.draw(self.image, self.position.X, 720/2, 0, 1, -1)
	else
		love.graphics.draw(self.image, self.position.X, 720/2)
	end
end
