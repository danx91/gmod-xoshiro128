--[[-------------------------------------------------------------------------
Poor man's tests
Basically all use cases covered and distribution checked (num and bool), nothing fancy
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Test NextUInt
---------------------------------------------------------------------------]]
--[[
local rng = xoshiro128()
for i = 1, 100 do
	print( rng:NextUInt(), math.random( 2 ^ 32 - 1 ) )
end
]]

--[[-------------------------------------------------------------------------
Test NextInt
---------------------------------------------------------------------------]]
--[[
local rng = xoshiro128()
for i = 1, 100 do
	print( rng:NextInt( -1024, 1024 ), math.random( -1024, 1024 ) )
end
]]

--[[-------------------------------------------------------------------------
Test NextFloat
---------------------------------------------------------------------------]]
--[[
local rng = xoshiro128()
for i = 1, 100 do
	print( rng:NextFloat(), math.random() )
end
]]

--[[-------------------------------------------------------------------------
Test NextBool
---------------------------------------------------------------------------]]
--[[
local rng = xoshiro128()
for i = 1, 100 do
	print( rng:NextBool(), math.random( 2 ) == 1 )
end
]]

--[[-------------------------------------------------------------------------
Test Next arguments
---------------------------------------------------------------------------]]
--[[
local rng = xoshiro128()
print( rng:Next() )
print( rng:Next( 10 ) )
print( rng:Next( 10, 20 ) )
print( rng:Next( 50, 30 ) )
]]

--[[-------------------------------------------------------------------------
Test if values are distributed uniformly (number)
---------------------------------------------------------------------------]]
--[[
local iterations = 1000000
local range = 16
print( string.format( "TEST UNIFORM DISTRIBUTION iterations=%i, range=%i", iterations, range ) )

local values = {}
local rng = xoshiro128()

for i = 1, iterations do
	local num = rng( range )
	values[num] = ( values[num] or 0 ) + 1
end

local expected = 1 / range
local var = 0

for i = 1, range do
	local num = ( values[i] or 0 )
	var = var + ( num / iterations - expected ) ^ 2

	print( i, num )
end

print( "VAR="..var )
]]

--[[-------------------------------------------------------------------------
Test if values are distributed uniformly (bool)
---------------------------------------------------------------------------]]
--[[
local iterations = 1000000
print( string.format( "TEST UNIFORM DISTRIBUTION (BOOL) iterations=%i", iterations ) )

local values = {}
local rng = xoshiro128()

for i = 1, iterations do
	local status = rng:NextBool() and 2 or 1
	values[status] = ( values[status] or 0 ) + 1
end

local expected = 1 / 2
local var = 0

for i = 1, 2 do
	local num = ( values[i] or 0 )
	var = var + ( num / iterations - expected ) ^ 2

	print( i == 2, num )
end

print( "VAR="..var )
]]

--[[-------------------------------------------------------------------------
Test same seed
---------------------------------------------------------------------------]]
--[[
local rng1 = xoshiro128( 43727459164 )
local rng2 = xoshiro128( 43727459164 )

for i = 1, 100 do
	print( rng1:NextUInt() == rng2:NextUInt() )
	print( rng1:NextFloat() == rng2:NextFloat() )
	print( rng1:NextInt( 69, 420 ) == rng2:NextInt( 69, 420 ) )
	print( rng1:NextBool() == rng2:NextBool() )
end
]]