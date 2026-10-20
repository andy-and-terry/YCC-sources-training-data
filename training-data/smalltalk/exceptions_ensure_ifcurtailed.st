| r |
r := [10 / 0] on: ZeroDivide do: [:e | e messageText displayNl. -1].
Transcript showCr: r printString.
r := [Error signal: 'custom'. 5] on: Error do: [:e | e return: e messageText].
Transcript showCr: r.
r := [Error new signal: 'resume me'. 7] on: Error do: [:e | e retryUsing: [99]].
Transcript showCr: r printString.
r := [(Warning signal: 'warn') printString] on: Warning do: [:e | e resume: 'resumed'].
Transcript showCr: r.
[Transcript showCr: 'body'] ensure: [Transcript showCr: 'ensure ran'].
[Error signal: 'x'] on: Error do: [:e | Transcript showCr: 'handled ', e class name].
[[Error signal: 'inner'] ensure: [Transcript showCr: 'cleanup']] on: Error do: [:e | e return: nil].
r := [Array new: 3; at: 10] on: SystemExceptions.IndexOutOfRange do: [:e | 'bad index'].
Transcript showCr: r printString.
r := [nil foo] on: MessageNotUnderstood do: [:e | e messageText].
Transcript showCr: r printString.
r := [Error signal: 'a'] on: Error, ZeroDivide do: [:e | e class name].
Transcript showCr: r.
Error subclass: MyError [ messageText [ ^'my custom error' ] ].
r := [MyError new signal] on: MyError do: [:e | e messageText].
Transcript showCr: r.
[#() first] on: Error do: [:e | Transcript showCr: 'empty collection'].
