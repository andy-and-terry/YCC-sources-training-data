Object subclass: Crc8Checksum [
    Crc8Checksum class >> of: aString [
        | crc |
        crc := 0.
        aString do: [:ch |
            crc := crc bitXor: ch value.
            8 timesRepeat: [
                crc := (crc bitAnd: 128) ~= 0
                    ifTrue: [((crc bitShift: 1) bitXor: 7) bitAnd: 255]
                    ifFalse: [(crc bitShift: 1) bitAnd: 255]]].
        ^crc
    ]
]

((Crc8Checksum of: '123456789') printString: 16) displayNl.
