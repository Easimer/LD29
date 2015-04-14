require("lib/class")
onscreenkey = class:new()

onscreenkey.key = "A"
onscreenkey.image = nil
onscreenkey.skin = "Black"

onscreenkey.setKey = function(self,key)
	self.key = key
end

onscreenkey.setSkin = function(self, skin)
	if not skin == "Black" or not skin == "White" or not skin == "Uni" then
		self.skin = "Black"
	else
		self.skin = skin
	end
end

onscreenkey.draw = function(self, x, y)
	if self.image == nil then
		self.image = love.graphics.newImage("data/controlkeys/Keyboard_" .. self.skin .. "_" .. self.key .. ".png")
	end
	love.graphics.draw(self.image, x, y)
end
