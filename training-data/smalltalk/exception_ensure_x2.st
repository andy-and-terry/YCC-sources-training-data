[ 1/0 ] on: ZeroDivide do: [:e | Transcript showCr: 'caught ', e messageText ].
[ Transcript showCr: 'body' ] ensure: [ Transcript showCr: 'cleanup' ].
