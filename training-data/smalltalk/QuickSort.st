Object subclass: QuickSort [
    QuickSort class >> sort: items [
        | pivot smaller mid larger |
        items size <= 1 ifTrue: [ ^items ].
        pivot := items at: (items size // 2) + 1.
        smaller := items select: [ :x | x < pivot ].
        mid := items select: [ :x | x = pivot ].
        larger := items select: [ :x | x > pivot ].
        ^(QuickSort sort: smaller), mid, (QuickSort sort: larger)
    ]
]

Transcript showCr: (QuickSort sort: #(5 3 8 1 9 2)) printString.
