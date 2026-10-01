--!native
--[[
    @author depso (depthso)
    @description Ultra-fast string builder library similar to C#, 
    faster than Luau's native string concat
]]

local Module = {}
Module.__index = Module

--// Types
export type Module = {
	Strings: {string},
	Ending: number
} & typeof(Module)

--// Functions
local Insert = table.insert
local Concat = table.concat
local Clear = table.clear

function Module.Append(self: Module, String: string)
	self.Ending += 1
	Insert(self.Strings, String)
end

function Module.MultiAppend(self: Module, ...)
	local Args = {...}

	local Length = #Args
	if Length == 0 then return end

	table.move(Args, 1, Length, self.Ending + 1, self.Strings)
	self.Ending += Length
end

function Module.Tostring(self: Module): string
	return Concat(self.Strings, nil, 1, self.Ending)
end

function Module.Destroy(self: Module)
	Clear(self)
end 

function Module.new(): Module
	return { 
		Strings = {},
		Append = Module.Append,
		Tostring = Module.Tostring,
		Destroy = Module.Destroy,
		MultiAppend = Module.MultiAppend,
		Ending = 0,
	} :: Module
end

return Module
