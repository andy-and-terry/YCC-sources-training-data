age(ann, 30). age(bob, 25). age(cy, 30).

% ?- findall(N, age(N, 30), L).
% ?- setof(N-A, age(N, A), L).
% ?- bagof(N, age(N, A), L).
