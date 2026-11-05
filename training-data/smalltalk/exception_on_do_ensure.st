| r |
r := [10 / 0] on: ZeroDivide do: [:e | e return: -1].
r printNl.
[Transcript showCr: 'body'] ensure: [Transcript showCr: 'cleanup'].
r := [Error signal: 'boom'. 5] on: Error do: [:e | e messageText].
r printNl.
