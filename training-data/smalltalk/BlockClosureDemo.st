Object subclass: BlockClosureDemo [
    BlockClosureDemo class >> makeCounter [
        | count |
        count := 0.
        ^[ count := count + 1. count ]
    ]
]

| counter1 counter2 |
counter1 := BlockClosureDemo makeCounter.
counter2 := BlockClosureDemo makeCounter.
Transcript showCr: counter1 value printString.
Transcript showCr: counter1 value printString.
Transcript showCr: counter2 value printString.
