Object subclass: EuropeanSocket [
    voltage [ ^230 ]
]

Object subclass: USPlugAdapter [
    | socket |
    socket: aSocket [ socket := aSocket ]
    voltage [ ^socket voltage / 2 ]
]

| socket adapter |
socket := EuropeanSocket new.
adapter := USPlugAdapter new socket: socket; yourself.

Transcript showCr: 'socket: ', socket voltage printString.
Transcript showCr: 'adapter: ', adapter voltage printString.
