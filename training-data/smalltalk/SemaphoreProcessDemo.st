| sem results |
sem := Semaphore new.
results := OrderedCollection new.

[ results add: 'worker done'. sem signal ] fork.
sem wait.
results add: 'main continues'.
results do: [ :r | Transcript showCr: r ].

"Mutual exclusion with a critical section"
| mutex counter done |
mutex := Semaphore forMutualExclusion.
counter := 0.
done := Semaphore new.
1 to: 3 do: [ :i |
    [ 100 timesRepeat: [ mutex critical: [ counter := counter + 1 ] ].
      done signal ] fork ].
3 timesRepeat: [ done wait ].
Transcript showCr: counter printString.
