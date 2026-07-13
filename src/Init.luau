--!native
--!strict
--[[
    @author depso (depthso)
    @description Ultra-fast string builder library similar to C#, faster than Luau's native string concat
]]

local Module = {}
Module.__index = Module

--// Types
type StringBuilder = {
	Strings: {string},
	Ending: number
}
type Methods = {
	Append: (self: Methods, String: string) -> (),
	Tostring: (self: Methods) -> string,
	Destroy: (self: Methods) -> (),
}
export type Module = StringBuilder & Methods
export type ModuleExport = {
	new: () -> Methods
}

--// Functions
local Insert = table.insert
local Concat = table.concat
local Clear = table.clear

function Module.Append(self: Module, String: string)
	self.Ending += 1
	Insert(self.Strings, String)
end

function Module.Tostring(self: Module): string
	return Concat(self.Strings, nil, self.Ending)
end

function Module.Destroy(self: Module)
	Clear(self)
end 

function Module.new(): Methods
	return { 
		Strings = {},
		Append = Module.Append,
		Tostring = Module.Tostring,
		Destroy = Module.Destroy,
		Ending = 0,
	} :: Methods
end

return Module :: ModuleExport
