% Dims has n+1 entries where matrix i has dimensions Dims[i] x Dims[i+1]
% (1-indexed). matrix_chain_cost(I, J, Cost) is the minimum scalar
% multiplications needed to multiply matrices I..J, trying every split
% point K and keeping the cheapest.
matrix_chain_cost(_, I, I, 0) :- !.
matrix_chain_cost(Dims, I, J, Cost) :-
    I < J,
    Jm1 is J - 1,
    findall(C, (
        between(I, Jm1, K),
        matrix_chain_cost(Dims, I, K, CostLeft),
        K1 is K + 1,
        matrix_chain_cost(Dims, K1, J, CostRight),
        nth1(I, Dims, Pi),
        nth1(K1, Dims, Pk1),
        J1 is J + 1,
        nth1(J1, Dims, Pj1),
        C is CostLeft + CostRight + Pi * Pk1 * Pj1
    ), Costs),
    min_list(Costs, Cost).

matrix_chain_order(Dims, Cost) :-
    length(Dims, Len),
    N is Len - 1,
    matrix_chain_cost(Dims, 1, N, Cost).

:- matrix_chain_order([40, 20, 30, 10, 30], Cost), writeln(Cost).
:- matrix_chain_order([10, 20, 30], Cost), writeln(Cost).
