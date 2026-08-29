Object subclass: LeapYear [
    LeapYear class >> isLeap: year [
        ^((year \\ 4 = 0) and: [ year \\ 100 ~= 0 ]) or: [ year \\ 400 = 0 ]
    ]
]

Transcript showCr: (LeapYear isLeap: 2000) printString.
Transcript showCr: (LeapYear isLeap: 1900) printString.
Transcript showCr: (LeapYear isLeap: 2024) printString.
