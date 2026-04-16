local StringBuilder = require("self/StringBuilder")
local Builder = StringBuilder.new()

Builder:Append("Hello world!")

local String = Builder:Tostring()
print(String)