% Squarefree numbers up to 100; expect 61.
squarefree(N) :- \+ (between(2, N, D), D * D =< N, N mod (D * D) =:= 0).
:- aggregate_all(count, (between(1, 100, N), squarefree(N)), C), writeln(C).
