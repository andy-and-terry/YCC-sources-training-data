| title n |
n := 701.
title := ''.
[n > 0] whileTrue: [
    n := n - 1.
    title := (String with: (Character value: 65 + (n \\ 26))), title.
    n := n // 26].
Transcript showCr: title. "ZY"
