% Aliquot sum classification.
aliquot(N, S) :- N1 is N - 1, findall(D, (between(1, N1, D), N mod D =:= 0), Ds), sum_list(Ds, S).
kind(N, A, perfect) :- A =:= N, !.
kind(N, A, abundant) :- A > N, !.
kind(_, _, deficient).
:- forall(member(N, [6, 12, 15, 28]), (aliquot(N, A), kind(N, A, K), format("~w ~w ~w~n", [N, A, K]))).
