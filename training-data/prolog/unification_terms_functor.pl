main :-
    X = f(Y, b), Y = a, format("~w~n", [X]),
    f(A, B) = f(1, 2), format("~w ~w~n", [A, B]),
    ( f(a) = g(a) -> writeln(unify) ; writeln(no_unify) ),
    functor(foo(a, b, c), Name, Arity), format("~w/~w~n", [Name, Arity]),
    functor(T, point, 2), format("~w~n", [T]),
    foo(1, 2, 3) =.. List, format("~w~n", [List]),
    Term =.. [bar, x, y], format("~w~n", [Term]),
    arg(2, foo(a, b, c), Arg), format("~w~n", [Arg]),
    copy_term(g(P, Q, P), Copy), format("~w~n", [Copy]),
    ( var(Q) -> writeln(unbound) ; writeln(bound) ),
    ( atom(abc), number(1.5), integer(3), compound(f(x)), is_list([a]), atomic("s") -> writeln(types_ok) ; true ),
    ( X == X, f(U) \== f(V), U \= V -> writeln(identity_checks) ; writeln(vars_unify) ),
    ground(f(a, b)), \+ ground(f(_)),
    term_variables(h(Z, k(W, Z)), Vars), length(Vars, NV), format("~w~n", [NV]),
    T2 = f(a), setarg(1, T2, b), format("~w~n", [T2]),
    tab(2), writeln(done),
    unify_with_occurs_check(R, g(S)), format("~w~n", [R-S]).
:- initialization(main).
