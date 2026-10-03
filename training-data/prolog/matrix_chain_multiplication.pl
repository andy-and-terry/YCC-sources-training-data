% Matrix chain multiplication: minimum scalar multiplications to fully
% parenthesize a chain, via memoized interval DP over cost/3.
:- dynamic(cost_memo/3).

chain_cost(Dims, I, I, 0) :- !.
chain_cost(Dims, I, J, Cost) :-
    I < J,
    ( cost_memo(I, J, Cost) -> true
    ; findall(C,
        ( between(I, J, K), K < J,
          chain_cost(Dims, I, K, CL),
          chain_cost(Dims, K + 1, J, CR),
          nth1(I, Dims, Di), nth1(K + 1, Dims, Dk), nth1(J + 1, Dims, Dj),
          C is CL + CR + Di * Dk * Dj
        ),
        Costs),
      min_list(Costs, Cost),
      assertz(cost_memo(I, J, Cost))
    ).

:- Dims = [40, 20, 30, 10, 30],
   length(Dims, Len),
   N is Len - 1,
   chain_cost(Dims, 1, N, Cost),
   writeln(Cost).
