" Rounding functions and float formatting.
let s:x = 3.14159
echo round(s:x) floor(s:x) ceil(s:x) trunc(s:x)
echo round(-2.5) floor(-2.5) ceil(-2.5)
echo printf('%.2f', s:x)
echo printf('%8.3f|', s:x)
echo printf('%e', 12345.678)
echo float2nr(7.9)
echo 10 / 4 10 / 4.0
echo abs(-3.5) fmod(7.5, 2)
