| r |
r := [10 / 0] on: ZeroDivide do: [:e | e return: -1].
Transcript showCr: r printString.
[Transcript showCr: 'working'. Error signal: 'oops'] 
    on: Error do: [:e | Transcript showCr: 'caught ', e messageText].
[Transcript showCr: 'body'] ensure: [Transcript showCr: 'cleanup'].
