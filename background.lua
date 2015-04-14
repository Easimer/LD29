require("lib/class")

background = class:new()

background.image = love.graphics.newImage("data/background/deep.png")

background.draw = function(self)
	love.graphics.draw(self.image)
end
