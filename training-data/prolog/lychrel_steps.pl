% Reverse-and-add until a palindrome; count the steps.
rev(N, R) :- number_codes(N, Cs), reverse(Cs, Rs), number_codes(R, Rs).

steps(N, Steps) :- steps(N, 0, Steps).

steps(N, Count, Count) :- Count > 0, rev(N, N), !.
steps(_, 100, -1) :- !.
steps(N, Count, Steps) :-
    rev(N, R), N1 is N + R, C1 is Count + 1,
    steps(N1, C1, Steps).

main :-
    findall(S, (member(N, [56, 57, 59, 79, 89]), steps(N, S)), Ss),
    atomic_list_concat(Ss, ' ', Out),
    writeln(Out).

:- initialization(main).
