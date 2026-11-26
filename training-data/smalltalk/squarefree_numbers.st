"Squarefree numbers up to 100; expect 61."
"Run with: gst <file>"

| squarefree |
squarefree := [:n |
    ((2 to: n sqrt floor) detect: [:d | n \\ (d * d) = 0] ifNone: [nil]) isNil].
((1 to: 100) select: [:n | squarefree value: n]) size printNl.
