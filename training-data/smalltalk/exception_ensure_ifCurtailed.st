[1/0] on: ZeroDivide do: [:e | 'caught' printNl. e return: 0].
[ 'body' printNl ] ensure: [ 'cleanup' printNl ].
