% N-Queens via CLP(FD) constraint propagation instead of generate-and-test
% permutation search (contrast with n_queens.pl's permutation/2 approach).
:- use_module(library(clpfd)).

queens_clpfd(N, Queens) :-
    length(Queens, N),
    Queens ins 1..N,
    all_different(Queens),
    safe_pairs(Queens),
    label(Queens).

safe_pairs([]).
safe_pairs([Q|Qs]) :-
    safe_pairs(Qs, Q, 1),
    safe_pairs(Qs).

safe_pairs([], _, _).
safe_pairs([Q|Qs], Q0, Dist) :-
    abs(Q - Q0) #\= Dist,
    Dist1 #= Dist + 1,
    safe_pairs(Qs, Q0, Dist1).

:- queens_clpfd(8, Queens), writeln(Queens).
:- findall(Q, queens_clpfd(6, Q), All), length(All, Count), writeln(Count).
