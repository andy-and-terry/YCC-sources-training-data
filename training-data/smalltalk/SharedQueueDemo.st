| queue producer consumerDone |
queue := SharedQueue new.
consumerDone := Semaphore new.

[ 1 to: 5 do: [ :i | queue nextPut: i * i ].
  queue nextPut: nil ] fork.

[ | item |
  [ (item := queue next) notNil ] whileTrue: [
      Transcript showCr: 'consumed ', item printString ].
  consumerDone signal ] fork.

consumerDone wait.
