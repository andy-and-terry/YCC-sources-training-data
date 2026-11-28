lyndon(W) :-
    length(W, N), N > 0,
    forall(( append(_, Suf, W), Suf \== [], Suf \== W ), W @< Suf).

longest_lyndon_prefix(S, Pre, Rest) :-
    findall(L, ( append(P, _, S), P \== [], lyndon(P), length(P, L) ), Ls),
    max_list(Ls, Len), length(Pre, Len), append(Pre, Rest, S).

factor([], []).
factor(S, [Atom|Fs]) :-
    S \== [], longest_lyndon_prefix(S, Pre, Rest),
    atom_codes(Atom, Pre), factor(Rest, Fs).

:- atom_codes(banana, Cs), factor(Cs, Fs), writeln(Fs).
