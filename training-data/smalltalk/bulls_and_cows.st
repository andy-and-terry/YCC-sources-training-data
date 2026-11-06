"Bulls and Cows scoring for equal-length digit strings."
| secret guess bulls pool cows |
secret := '1807'.
guess := '7810'.
bulls := 0.
pool := OrderedCollection new.
cows := 0.
1 to: secret size do: [:i |
    (secret at: i) = (guess at: i)
        ifTrue: [bulls := bulls + 1]
        ifFalse: [pool add: (secret at: i)]].
1 to: guess size do: [:i |
    (secret at: i) = (guess at: i) ifFalse: [
        (pool includes: (guess at: i)) ifTrue: [
            cows := cows + 1.
            pool remove: (guess at: i)]]].
Transcript showCr: bulls printString, ' bull(s), ', cows printString, ' cow(s)'.
