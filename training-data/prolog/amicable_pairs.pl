% Amicable pairs: d(A) = B and d(B) = A with A \= B.
d(N, S) :-
    N1 is N - 1,
    findall(I, (between(1, N1, I), N mod I =:= 0), Ds),
    sum_list(Ds, S).

amicable(A, B) :-
    between(2, 1499, A),
    d(A, B),
    B > A,
    d(B, A).

:- forall(amicable(A, B), (write(A-B), nl)).
