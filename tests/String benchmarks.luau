--// This was thrown together pretty quick lol
--// We are testing the time it takes to concatinate 30 thousand times

local StringBuilder = require(script.StringBuilder)

coroutine.wrap(function()
	local String = ""
	local Start = os.clock()
	for i = 1, 30000 do
		String ..= `var {i} = {i}`
	end
	print("Interpolation", os.clock()-Start)
end)()

coroutine.wrap(function()
	local String = ""
	local Start = os.clock()
	for i = 1, 30000 do
		String ..= string.format("var %d = %d", i, i)
	end
	print("String.format", os.clock()-Start)
end)()

coroutine.wrap(function()
	local String = ""
	local Start = os.clock()
	for i = 1, 30000 do
		String ..= "var " .. i .. " = " .. i
	end
	print("String concat", os.clock()-Start)
end)()

coroutine.wrap(function() -- StringBuilder!
	local Builder = StringBuilder.new()
	local Start = os.clock()
	for i = 1, 30000 do
		Builder:Append("var " .. i .. " = " .. i)
	end

	local String = Builder:Tostring()
	print("StringBuilder", os.clock()-Start)
end)()
