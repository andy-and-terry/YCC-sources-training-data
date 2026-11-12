:- initialization(main).
main :- findall(P, permutation([1,2,3], P), Ps), length(Ps, N), writeln(N), writeln(Ps).
