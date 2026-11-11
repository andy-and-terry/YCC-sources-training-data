"Square of the sum minus sum of squares for 1..10 (expect 2640)"
| xs total squares |
xs := (1 to: 10) asOrderedCollection.
total := xs inject: 0 into: [:a :x | a + x].
squares := xs inject: 0 into: [:a :x | a + (x * x)].
Transcript showCr: ((total * total) - squares) printString.
