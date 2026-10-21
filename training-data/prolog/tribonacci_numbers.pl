% Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)

% trib_list(+Count, -List): first Count tribonacci numbers
trib_list(Count, List) :-
    trib_list(Count, 0, 0, 1, List).

trib_list(0, _, _, _, []) :- !.
trib_list(N, A, B, C, [A|Rest]) :-
    N1 is N - 1,
    D is A + B + C,
    trib_list(N1, B, C, D, Rest).

:- initialization(main).
main :-
    trib_list(15, L),
    format("Tribonacci: ~w~n", [L]),
    halt.
