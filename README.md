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