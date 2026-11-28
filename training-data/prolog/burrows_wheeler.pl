rotations(Cs, Rots) :-
    length(Cs, N), M is N - 1,
    findall(R, ( between(0, M, I), length(Pre, I), append(Pre, Suf, Cs), append(Suf, Pre, R) ), Rots).

bwt(S, Out) :-
    atom_codes(S, Cs), rotations(Cs, Rots),
    msort(Rots, Sorted),
    findall(L, ( member(R, Sorted), last(R, L) ), Ls),
    atom_codes(Out, Ls).

:- bwt('banana$', O), writeln(O).
