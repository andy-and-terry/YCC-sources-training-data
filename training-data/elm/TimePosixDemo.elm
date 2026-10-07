module TimePosixDemo exposing (describe, formatClock, monthNumber)

import Time


monthNumber : Time.Month -> Int
monthNumber month =
    case month of
        Time.Jan ->
            1

        Time.Feb ->
            2

        Time.Mar ->
            3

        Time.Apr ->
            4

        Time.May ->
            5

        Time.Jun ->
            6

        Time.Jul ->
            7

        Time.Aug ->
            8

        Time.Sep ->
            9

        Time.Oct ->
            10

        Time.Nov ->
            11

        Time.Dec ->
            12


pad : Int -> String
pad n =
    String.padLeft 2 '0' (String.fromInt n)


formatClock : Time.Posix -> String
formatClock posix =
    String.join ":"
        [ pad (Time.toHour Time.utc posix)
        , pad (Time.toMinute Time.utc posix)
        , pad (Time.toSecond Time.utc posix)
        ]


describe : Time.Posix -> String
describe posix =
    String.fromInt (Time.toYear Time.utc posix)
        ++ "-"
        ++ pad (monthNumber (Time.toMonth Time.utc posix))
        ++ "-"
        ++ pad (Time.toDay Time.utc posix)
        ++ " "
        ++ formatClock posix


-- describe (Time.millisToPosix 0) == "1970-01-01 00:00:00"
