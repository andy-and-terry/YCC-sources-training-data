| ages names older inverted |
ages := Dictionary new.
ages at: #ann put: 31; at: #bob put: 25; at: #cy put: 47.

ages keysAndValuesDo: [ :k :v | Transcript showCr: k printString, ' -> ', v printString ].

names := ages keys asSortedCollection: [ :a :b | a <= b ].
Transcript showCr: names asArray printString.
Transcript showCr: ages values asSortedCollection asArray printString.

Transcript showCr: (ages at: #zed ifAbsent: [ 0 ]) printString.
Transcript showCr: (ages at: #zed ifAbsentPut: [ 18 ]) printString.
Transcript showCr: (ages includesKey: #zed) printString.
Transcript showCr: (ages keyAtValue: 47) printString.
Transcript showCr: (ages removeKey: #zed) printString.
Transcript showCr: ages size printString.

older := ages select: [ :v | v > 30 ].
Transcript showCr: older keys asSortedCollection asArray printString.
Transcript showCr: (ages collect: [ :v | v * 2 ]) values asSortedCollection asArray printString.
Transcript showCr: (ages inject: 0 into: [ :acc :v | acc + v ]) printString.

inverted := Dictionary new.
ages keysAndValuesDo: [ :k :v | inverted at: v put: k ].
Transcript showCr: (inverted at: 25) printString.
Transcript showCr: (ages associations size) printString.
