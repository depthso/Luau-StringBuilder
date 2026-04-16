--!native
--[[
    @author depso (depthso)
    @description Ultra-fast string builder library similar to C#, faster than Luau's native string concat
]]

local Module = {}
Module.__index = Module

--// Types
type StringBuilder = {
	Strings: {string}
}
export type Module = StringBuilder & typeof(Module)

--// Functions
local Insert = table.insert
local Concat = table.concat
local Clear = table.clear

function Module.Append(self: Module, String: string)
	Insert(self.Strings, String)
end

function Module.Tostring(self: Module): string
	return Concat(self.Strings)
end

function Module.Destroy(self: Module)
	Clear(self.Strings)
	Clear(self)
end 

function Module.new(): Module
	return { 
		Strings = {},
		Append = Module.Append,
		Tostring = Module.Tostring,
		Destroy = Module.Destroy
	}
end

return Module
