| values |
values := OrderedCollection new.
values add: 3; add: 3.5; add: 'text'; add: #sym; add: nil; add: (1/2).

values do: [:v |
    Transcript
        show: v printString; tab;
        show: v class name; tab;
        show: (v isKindOf: Number) printString; tab;
        show: (v isMemberOf: Integer) printString; tab;
        show: v isString printString; tab;
        show: v isNil printString; cr].

Transcript showCr: (3 isKindOf: Magnitude) printString.
Transcript showCr: (3 class inheritsFrom: Number) printString.
Transcript showCr: (SmallInteger superclass) printString.
Transcript showCr: (#sym isSymbol) printString.
Transcript showCr: ('abc' isSymbol) printString.
