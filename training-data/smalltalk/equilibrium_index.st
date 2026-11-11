| nums total left result |
nums := #(1 7 3 6 5 6).
total := nums inject: 0 into: [:a :b | a + b].
left := 0.
result := 0.
nums doWithIndex: [:v :i |
    (result = 0 and: [left = (total - left - v)]) ifTrue: [result := i].
    left := left + v].
Transcript showCr: result printString. "4 (1-based)"
