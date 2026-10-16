| oc |
oc := OrderedCollection new.
oc add: 10; add: 20; add: 30.
oc addFirst: 5.
oc add: 15 beforeIndex: 3.
Transcript showCr: oc printString.

Transcript showCr: oc removeFirst printString.
Transcript showCr: oc removeLast printString.
oc remove: 15.
Transcript showCr: oc printString.
Transcript showCr: (oc indexOf: 20) printString.
Transcript showCr: (oc includes: 99) printString.
oc addAll: #(1 2 3).
Transcript showCr: oc size printString.
Transcript showCr: (oc copyFrom: 2 to: 4) printString.
