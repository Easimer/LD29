require("lib/class")
require("walker")

map = class:new()

map.whiteline = {}
map.blackline = {}

map.t = 0
map.realt = 0

map.tick = function(self, dt)
	self.t = self.t + dt
	self.realt = self.realt+dt
	if self.t > 5 then
		print("spawning! (tick)")
		self.t = 0
		self:spawn()
	else
		print("not spawning")
	end
	print("ticking")
	for k,v in pairs(self.whiteline) do
		print("ticking: " .. v.color)
		v:tick(dt)
	end
	for k,v in pairs(self.blackline) do
		print("ticking: " .. v.color)
		v:tick(dt)
	end
end

map.spawn = function(self)
	print("spawning! (spawn)")
	test = walker:new()
	if math.random() > 0.5 then
		test:setImage("black")
	else
		test:setImage("white")
	end
	if math.random() > 0.5 then
		table.insert(self.whiteline, test)
	else
		table.insert(self.blackline, test)
	end
end

map.draw = function(self)
	print("drawing!")
	for k,v in pairs(self.whiteline) do
		print("drawing: " .. v.color)
		v:draw()
	end
	for k,v in pairs(self.blackline) do
		print("drawing: " .. v.color)
		v:draw()
	end
end
