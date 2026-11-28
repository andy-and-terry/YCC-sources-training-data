| isHappy found n |
isHappy := [:start |
    | seen m |
    seen := Set new.
    m := start.
    [m = 1 or: [seen includes: m]] whileFalse: [
        seen add: m.
        m := m printString inject: 0 into: [:acc :c | acc + (c digitValue * c digitValue)]].
    m = 1].

found := OrderedCollection new.
n := 1.
[found size < 8] whileTrue: [
    (isHappy value: n) ifTrue: [found add: n].
    n := n + 1].
Transcript showCr: found printString. "OrderedCollection (1 7 10 13 19 23 28 31)"
