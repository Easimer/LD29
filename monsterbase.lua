--MonsterBase
require("lib/class")
require("lib/loveframes")
monsterbase = class:new()

monsterbase.health = 10
monsterbase.speed = 5
monsterbase.image = nil
monsterbase.score = 1
monsterbase.color = "black"
monsterbase.position = {}
monsterbase.position.X = 1152
monsterbase.flip = false

monsterbase.spawn = function(self, flip, color)
	self.setFlip(flip)
	self.color = color
end

monsterbase.setFlip = function(self, flip)
	self.flip = flip
end

monsterbase.tick = function(self, dt)
	self.position.X = self.position.X - self.speed 
end

monsterbase.draw = function(self)
	if self.flip then
		love.graphics.draw(self.image, self.position.X, 720/2, 0, 1, -1)
	else
		love.graphics.draw(self.image, self.position.X, 720/2)
	end
end
