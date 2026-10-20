age(ann, 30). age(bob, 25). age(cy, 30).
:- findall(N, age(N, 30), L), writeln(L).
:- setof(A-N, age(N, A), L), writeln(L).
