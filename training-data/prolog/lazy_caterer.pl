pieces(Cuts, P) :- P is (Cuts * Cuts + Cuts + 2) // 2.

main :- findall(P, (between(0, 9, N), pieces(N, P)), L), write(L), nl.
% [1,2,4,7,11,16,22,29,37,46]
:- initialization(main).
