% Amicable pairs below 1500 via sums of proper divisors.
s(N, S) :-
    N1 is N - 1,
    findall(D, (between(1, N1, D), N mod D =:= 0), Ds),
    sum_list(Ds, S).

main :-
    forall(( between(2, 1499, A), s(A, B), B > A, s(B, A) ),
           format("~w ~w~n", [A, B])).

:- initialization((main, halt)).
