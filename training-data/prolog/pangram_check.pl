pangram(Text) :-
    string_lower(Text, Lower),
    string_chars(Lower, Chars),
    forall(between(0'a, 0'z, Code),
           ( char_code(C, Code), memberchk(C, Chars) )).

:- ( pangram("The quick brown fox jumps over the lazy dog") -> writeln(yes) ; writeln(no) ).
:- ( pangram("Hello, world") -> writeln(yes) ; writeln(no) ).
