| words |
words := #('alpha' 'beta' 'gamma') asOrderedCollection.

words do: [ :w | Transcript show: w ] separatedBy: [ Transcript show: ', ' ].
Transcript nl.

words reverse do: [ :w | Transcript show: w asUppercase ] separatedBy: [ Transcript show: ' | ' ].
Transcript nl.
