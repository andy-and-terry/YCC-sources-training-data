Object subclass: GlyphFactory [
    | cache |
    init [ cache := Dictionary new ]
    GlyphFactory class >> new [ ^super new init ]
    glyphFor: aChar [
        ^cache at: aChar ifAbsentPut: [ 'glyph-', (String with: aChar) ]
    ]
    size [ ^cache size ]
]

| factory a b |
factory := GlyphFactory new.
a := factory glyphFor: $x.
b := factory glyphFor: $x.
factory glyphFor: $y.
Transcript showCr: (a == b) printString.
Transcript showCr: factory size printString.
