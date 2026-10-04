% sub_atom/5 finds, extracts, and enumerates substrings.
:- sub_atom(hello_world, 0, 5, _, Sub), write(Sub), nl.
:- sub_atom(hello_world, B, _, 0, world), write(B), nl.
:- sub_atom(banana, B, _, _, ana), write(B), write(' '), fail ; nl.
:- atomic_list_concat(Parts, ',', 'a,b,c'), write(Parts), nl.
:- atomic_list_concat([x, y, z], '-', R), write(R), nl.

count_occurrences(Sub, Atom, Count) :-
    aggregate_all(count, sub_atom(Atom, _, _, _, Sub), Count).

starts_with(Prefix, Atom) :- sub_atom(Atom, 0, _, _, Prefix).
ends_with(Suffix, Atom) :- sub_atom(Atom, _, _, 0, Suffix).

:- count_occurrences(a, banana, N), write(N), nl.
:- starts_with(pro, prolog), ends_with(log, prolog), write(yes), nl.
