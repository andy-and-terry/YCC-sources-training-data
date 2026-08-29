Object subclass: BinaryToDecimal [
    BinaryToDecimal class >> convert: str [
        ^Number readFrom: str radix: 2
    ]
]

Transcript showCr: (BinaryToDecimal convert: '1011') printString.
