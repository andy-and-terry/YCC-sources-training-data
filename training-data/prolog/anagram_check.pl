normalize_str(Str, Normalized) :-
    string_lower(Str, Lower),
    string_chars(Lower, Chars),
    exclude([C]>>(C == ' '), Chars, Filtered),
    msort(Filtered, Normalized).

is_anagram(A, B) :-
    normalize_str(A, NA),
    normalize_str(B, NB),
    NA == NB.

:- (is_anagram("listen", "silent") -> writeln(true) ; writeln(false)).
:- (is_anagram("hello", "world") -> writeln(true) ; writeln(false)).
