% Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
digits(N, Ds) :- number_codes(N, Cs), maplist([C, D]>>(D is C - 48), Cs, Ds).

% Seq is kept newest-first.
keith_loop(Seq, _, N) :- Seq = [Last | _], Last >= N, !, Last =:= N.
keith_loop(Seq, K, N) :-
    length(Prefix, K), append(Prefix, _, Seq),
    sum_list(Prefix, Next),
    keith_loop([Next | Seq], K, N).

keith(N) :-
    digits(N, Ds), length(Ds, K), reverse(Ds, Rev),
    keith_loop(Rev, K, N).

main :-
    findall(N, (between(10, 1199, N), keith(N)), L),
    atomic_list_concat(L, ' ', A), writeln(A).

:- initialization((main, halt)).
