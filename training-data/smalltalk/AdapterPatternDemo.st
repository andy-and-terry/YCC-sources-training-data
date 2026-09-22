Object subclass: EuropeanSocket [
    voltage [ ^230 ]
]

Object subclass: USPlugAdapter [
    | socket |
    socket: aSocket [ socket := aSocket ]
    voltage [ ^socket voltage / 2 ]
]

Object subclass: USDevice [
    | adapter |
    adapter: anAdapter [ adapter := anAdapter ]
    powerOn [ ^'running at ', adapter voltage printString, 'V' ]
]

| euroSocket adapter device |
euroSocket := EuropeanSocket new.
adapter := USPlugAdapter new socket: euroSocket; yourself.
device := USDevice new adapter: adapter; yourself.

Transcript showCr: device powerOn.
