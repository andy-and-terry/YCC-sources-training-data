| text |
text := 'Education is beautiful' asLowercase.
'aeiou' do: [:v |
    Transcript show: v asString, '=', (text occurrencesOf: v) printString, ' '].
Transcript cr.
