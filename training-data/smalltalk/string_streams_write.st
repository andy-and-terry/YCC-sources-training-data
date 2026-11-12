| ws |
ws := WriteStream on: String new.
#('a' 'b' 'c') do: [:s | ws nextPutAll: s] separatedBy: [ws nextPutAll: ', '].
ws contents printNl.
'hello' reversed printNl.
'hello' asUppercase printNl.
