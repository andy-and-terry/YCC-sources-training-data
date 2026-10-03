Object subclass: GlyphStyle [
    | fontName size |
    fontName: f size: s [ fontName := f. size := s ]
    describe: char at: position [
        ^char, '@', position printString, ' in ', fontName, ' ', size printString
    ]
]

Object subclass: GlyphStyleFactory [
    GlyphStyleFactory class [ | styles | ]

    GlyphStyleFactory class >> styles [
        ^styles ifNil: [ styles := Dictionary new ]
    ]

    GlyphStyleFactory class >> styleFor: fontName size: size [
        | key |
        key := fontName , '-' , size printString.
        ^self styles at: key ifAbsentPut: [ GlyphStyle new fontName: fontName size: size; yourself ].
    ]
]

| a b |
a := GlyphStyleFactory styleFor: 'Arial' size: 12.
b := GlyphStyleFactory styleFor: 'Arial' size: 12.
Transcript showCr: (a == b) printString.
Transcript showCr: (a describe: 'H' at: 0).
