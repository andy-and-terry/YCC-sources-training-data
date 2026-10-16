:- copy_term(f(X, Y, X), Copy), writeln(Copy), X = 1, writeln(Copy), writeln(Y).

% Each copy gets fresh variables, so one clause template can be reused.
template(pair(A, A, _)).
:- template(T), copy_term(T, T1), T1 = pair(1, _, 2), writeln(T1),
   copy_term(T, T2), T2 = pair(x, Z, y), writeln(T2-Z).

% copy_term/3 also returns attributed-variable goals.
:- dif(Q, a), copy_term(Q, Q2, Goals), writeln(Goals), ( Q2 = Q2 -> true ; true ).

:- findall(V-V, member(V, [1, 2]), Pairs), writeln(Pairs).
