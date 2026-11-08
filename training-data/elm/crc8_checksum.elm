module Crc8Checksum exposing (crc8)

import Bitwise


crc8 : List Int -> Int
crc8 =
    List.foldl byte 0


byte : Int -> Int -> Int
byte b crc =
    List.foldl (\_ c -> step c) (Bitwise.xor crc b) (List.range 1 8)


step : Int -> Int
step c =
    if Bitwise.and c 0x80 /= 0 then
        Bitwise.and (Bitwise.xor (Bitwise.shiftLeftBy 1 c) 0x07) 0xFF

    else
        Bitwise.and (Bitwise.shiftLeftBy 1 c) 0xFF
