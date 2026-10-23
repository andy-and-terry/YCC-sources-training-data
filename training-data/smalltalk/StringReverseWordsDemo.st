"Reverse words and strings using basic collection protocol."
| sentence words reversedWords palindromeCheck |
sentence := 'the quick brown fox'.

Transcript showCr: sentence reversed.

words := sentence substrings: ' '.
reversedWords := words reverse.
Transcript showCr: (reversedWords inject: '' into: [:acc :w |
    acc isEmpty ifTrue: [w] ifFalse: [acc, ' ', w]]).

"Reverse each word but keep word order"
Transcript showCr: ((words collect: [:w | w reversed]) inject: '' into: [:acc :w |
    acc isEmpty ifTrue: [w] ifFalse: [acc, ' ', w]]).

palindromeCheck := [:s |
    | clean |
    clean := (s select: [:c | c isLetter]) asLowercase.
    clean = clean reversed].

Transcript showCr: (palindromeCheck value: 'A man, a plan, a canal: Panama') printString.
Transcript showCr: (palindromeCheck value: 'hello') printString.

"Longest word"
Transcript showCr: (words inject: '' into: [:best :w | w size > best size ifTrue: [w] ifFalse: [best]]).
Transcript showCr: (words collect: [:w | w size]) printString.
