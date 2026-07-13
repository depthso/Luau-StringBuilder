# StringBuilder for Luau ⚡
A high-performance StringBuilder library for Luau that builds strings 260x faster than regular Lua concatenation, this was inspired by C#'s high performance StringBuilder library.

## Context
While benchmarking string concatination methods I noticed table.concat outperformed Lua's `"a" .. "b"` by over **800 TIMES!**. And yes it's very really true too! This library is a complete implimentation of that very method I discovered and yes it has over **800x** string performance! 

### Benchmark results
<img width="577" height="161" alt="image" src="https://github.com/user-attachments/assets/510574e2-a827-44a4-8754-4e6db26f7ac4" />

# Example script
Builds a "Hello world!" string and prints it
```lua
local StringBuilder = require("@self/StringBuilder")

local Builder = StringBuilder.new()
Builder:Append("Hello world!")

local String = Builder:Tostring()
print(String) --> "Hello world!"
```
