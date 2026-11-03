| swapCase |
swapCase := [:s |
    (s collect: [:c | c isUppercase ifTrue: [c asLowercase] ifFalse: [c asUppercase]])].

(swapCase value: 'Hello World 42') displayNl.
