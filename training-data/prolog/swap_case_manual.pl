swap_char(C, S) :- char_type(C, upper(L)), !, S = L.
swap_char(C, U) :- char_type(C, lower(U)), !.
swap_char(C, C).

swap_case(In, Out) :-
    string_chars(In, Cs),
    maplist(swap_char, Cs, Ss),
    string_chars(Out, Ss).

:- swap_case("Hello World 42", R), writeln(R).
