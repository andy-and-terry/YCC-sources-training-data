vowel(C) :- memberchk(C, [a, e, i, o, u]).

pig_word(Word, Pig) :-
    atom_chars(Word, [F|_]),
    vowel(F), !,
    atom_concat(Word, way, Pig).
pig_word(Word, Pig) :-
    atom_chars(Word, Chars),
    append(Consonants, [V|Rest], Chars),
    Consonants \== [],
    maplist(\=(V), []), vowel(V),
    \+ ( member(C, Consonants), vowel(C) ), !,
    append([V|Rest], Consonants, Moved),
    append(Moved, [a, y], PigChars),
    atom_chars(Pig, PigChars).
pig_word(Word, Pig) :- atom_concat(Word, ay, Pig).

:- forall(member(W, [the, quick, apple, string, rhythm]),
          ( pig_word(W, P), format("~w -> ~w~n", [W, P]) )).
