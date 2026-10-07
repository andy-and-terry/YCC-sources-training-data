% Rabin-Karp substring search: a rolling polynomial hash narrows down
% candidate start positions before paying for a full sub_string check.
char_value(C, V) :- char_code(C, V).

poly_hash(Chars, Base, Prime, Hash) :-
    foldl([C, Acc0, Acc]>>(char_value(C, V), Acc is (Acc0 * Base + V) mod Prime), Chars, 0, Hash).

rabin_karp(Text, Pattern, Positions) :-
    string_chars(Text, TextChars),
    string_chars(Pattern, PatChars),
    string_length(Text, TLen),
    string_length(Pattern, PLen),
    Base = 256, Prime = 101,
    poly_hash(PatChars, Base, Prime, PatHash),
    MaxStart is TLen - PLen,
    findall(Start,
        ( between(0, MaxStart, Start),
          sub_atom(Text, Start, PLen, _, Window0),
          atom_string(Window0, WindowStr),
          string_chars(WindowStr, WindowChars),
          poly_hash(WindowChars, Base, Prime, WinHash),
          WinHash == PatHash,
          WindowStr == Pattern
        ),
        Positions).

:- rabin_karp("abxabcabcaby", "abc", Positions), writeln(Positions).
