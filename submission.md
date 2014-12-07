**folder:** https://github.com/raehik/hamming-coder
**commit:** https://github.com/raehik/hamming-coder/commit/e83dcde9745ad4693324ea4f15bf9899c0a18c32

    e83dcde: initial commit: **** me sideways it works

Coder implemented, seems to work mostly. Might not work if number of
data bits is 2^n - 1, since I had to do some *really* hacky stuff to get
bits to work in those 'edge' cases. But I can't find a reliable and
easy-to-use calculator online, so I haven't checked many inputs.

Probably would've been easier if I knew how to deal with bits in a
programming language. No doubt it'd be possible in C, but I'm not so
confident in it. Instead, my implementation here used a list of
Integers, each being 1 or 0. Not the worst idea, but way overkill
considering each one is represented as something like 0000000000000001
(assuming 16-bit).

The thing that I worked out a little late was that you had to insert the
parity bits first, then work out their value. I could definitely improve
speed by caching the parity bits' positions, but I was lazy and kinda
just copied the same code I used to loop through for positions at powers
of 2 :/

Tested using Ruby 2.1.3p242.
