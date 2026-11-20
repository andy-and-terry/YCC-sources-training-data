% Lattice paths by recursion on the grid dimensions.
lattice(0, _, 1) :- !.
lattice(_, 0, 1) :- !.
lattice(R, C, N) :- R1 is R - 1, C1 is C - 1, lattice(R1, C, A), lattice(R, C1, B), N is A + B.
:- lattice(3, 3, N), print(N), nl.
