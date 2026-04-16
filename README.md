# StringBuilder for Luau
A high-performance StringBuilder library for Luau, inspired by C#'s efficient and performant StringBuilder library.

## Context
While benchmarking string concatination methods I noticed table.concat outperformed Lua's `"a" .. "b"` by **260 TIMES!**. And yes it's very really true too! This library is a complete implimentation of that very method I discovered and yes it has that **260x** string performance! 

### Benchmark results
![alt text](/.github/images/image.png)

# Example script
Builds a "Hello world!" string and prints it
```lua
local StringBuilder = require("self/StringBuilder")
local Builder = StringBuilder.new()

Builder:Append("Hello world!")

local String = Builder:Tostring()
print(String) --> "Hello world!"
```