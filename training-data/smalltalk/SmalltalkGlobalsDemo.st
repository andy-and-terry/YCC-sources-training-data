Smalltalk at: #Counter put: 0.

1 to: 5 do: [ :i | Smalltalk at: #Counter put: (Smalltalk at: #Counter) + i ].
Transcript showCr: (Smalltalk at: #Counter) printString.

Transcript showCr: (Smalltalk includesKey: #Counter) printString.
Transcript showCr: (Smalltalk includesKey: #NoSuchGlobal) printString.
Transcript showCr: (Smalltalk at: #NoSuchGlobal ifAbsent: [ 'missing' ]) printString.

Smalltalk at: #Greeting put: 'hello'.
Transcript showCr: Greeting asUppercase.

Smalltalk removeKey: #Greeting.
Transcript showCr: (Smalltalk includesKey: #Greeting) printString.
