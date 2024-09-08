# xoshiro128** PRNG Lua implementation
This is Lua implementation of xoshiro128** PRNG. It was created by me for me to use it in Garry's Mod. This code won't work in plain Lua as it uses some Garry's Mod specific functions and bit library instead of built in bitwise operators. As Lua 5.4 already implements xoshiro256**, this code is aimed mostly to people who are stuck with older version of Lua. xoshiro128** algorithm provides fast and efficient alternative to obsolete C rand function. Major advantages are:
* You can have multiple generators running concurrently
* You can set the seed of the generator without messing with math.randomseed() which affects all subsequent calls of math.random()

# Few words from the author
* There is a lot of modulo 2^32 - it used to "simulate" overflow of uint32
* I didn't test it on 32 bit build as Lua numbers are internally stored as double and since IEEE 754 standard all doubles are always 64 bit no matter the architecture, so nothing differs
* If performance is priority for you, feel free to strip all `assert` calls
* This code might not be perfect and might have some flaws so as stated in the license, I don't give any warranty - use this code at your own risk!
* Feel free to fork, open issues or open pull requests if you want to improve this code
* Algorithm implementation is heavily based on the work of Sebastiano Vigna and David Blackman and their C implementation of xoshiro128**. I don't claim any copyrights of any part of their original code

# xoshiro128** PRNG Lua implementation
This is Lua implementation of xoshiro128** PRNG. It was created by me for me to use it in Garry's Mod, however this code should work in just plain Lua. As Lua 5.4 already implements xoshiro256**, this code is aimed mostly to people who are stuck with older version of Lua. xoshiro128** algorithm provides fast and efficient alternative for obsolete C rand function. Major advantages are:
* You can have multiple generators running concurrently
* You can set the seed of the generator without messing with math.randomseed() which affects all subsequent call of math.random()

# Few words from the author
* There is a lot of modulo 2^32 - it used to "simulate" overflow of uint32
* I didn't test it on 32 bit build as Lua numbers are internally stored as double and since IEEE 754 standard all doubles are always 64 bit no matter the architecture, so nothing differs
* If performance is priority for you, feel free to strip all `assert` calls
* This code might not be perfect and might have some flaws so as stated in the license, I don't give any warranty - use this code at your own risk!
* Feel free to fork, open issues or open pull requests if you want to improve this code
* Algorithm implementation is heavily based on the work of Sebastiano Vigna and David Blackman and their C implementation of xoshiro128**. I don't claim any copyrights of any part of their original code

# Example usage
## Random seed
```lua
local rng = xoshiro128()
print( rng( 10 ) ) --just call rng like you call math.random, arguments follow the same rules here
```
## Set seed
```lua
local rng = xoshiro128( 1234567890 ) --just provide seed as argument to xoshiro128 call
```
## All ways to call xoshiro128 object
```lua
local rng = xoshiro128()

--call object
print( rng() ) --returns number (float) from 0 (inclusive) to 1 (exclusive)
print( rng( 10 ) ) --returns number (integer) from 1 (inclusive) to 10 (inclusive)
print( rng( 100, 200 ) ) --returns number (integer) from 100 (inclusive) to 200 (inclusive)

--call Next() - it works exactly like the way above
print( rng:Next() ) --returns number (float) from 0 (inclusive) to 1 (exclusive)
print( rng:Next( 10 ) ) --returns number (integer) from 1 (inclusive) to 10 (inclusive)
print( rng:Next( 100, 200 ) ) --returns number (integer) from 100 (inclusive) to 200 (inclusive)

--other calls
print( rng:NextUInt() ) --Returns number (integer) between 0 (inclusive) and 2^32-1 (inclusive)
print( rng:NextInt( -100, 100 ) ) --returns number (integer) from -100 (inclusive) to 100 (inclusive). Note that it's similar to Next() call, but here both arguments are required!
print( rng:NextFloat() ) --returns number (float) from 0 (inclusive) to 1 (exclusive). Same as calling Next() without arguments
print( rng:NextBool() ) --returns boolean (true/false)
```