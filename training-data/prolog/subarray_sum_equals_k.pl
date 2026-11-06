% Count contiguous subarrays whose sum equals K (brute-force over start/end).
count_subarrays(Nums, K, Count) :-
    findall(x,
            ( append(_, Rest, Nums),
              append(Sub, _, Rest),
              Sub \= [],
              sum_list(Sub, K) ),
            Hits),
    length(Hits, Count).

:- count_subarrays([1, 1, 1], 2, C), print(C), nl.
