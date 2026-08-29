is_valid(Str) :-
    string_chars(Str, Chars),
    valid_helper(Chars, []).

valid_helper([], []).
valid_helper(['('|T], Stack) :- valid_helper(T, ['('|Stack]).
valid_helper(['['|T], Stack) :- valid_helper(T, ['['|Stack]).
valid_helper(['{'|T], Stack) :- valid_helper(T, ['{'|Stack]).
valid_helper([')'|T], ['('|Rest]) :- valid_helper(T, Rest).
valid_helper([']'|T], ['['|Rest]) :- valid_helper(T, Rest).
valid_helper(['}'|T], ['{'|Rest]) :- valid_helper(T, Rest).

:- (is_valid("{[()]}") -> writeln(true) ; writeln(false)).
:- (is_valid("{[(])}") -> writeln(true) ; writeln(false)).
