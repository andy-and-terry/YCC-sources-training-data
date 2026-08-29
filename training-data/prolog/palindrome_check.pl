is_palindrome(Str) :-
    string_lower(Str, Lower),
    string_chars(Lower, Chars),
    include([C]>>char_type(C, alnum), Chars, Filtered),
    reverse(Filtered, Filtered).

:- (is_palindrome("racecar") -> writeln(true) ; writeln(false)).
:- (is_palindrome("hello") -> writeln(true) ; writeln(false)).
