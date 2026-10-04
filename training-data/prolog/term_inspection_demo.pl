:- initialization(main).

main :-
    T = point(3, 4, red),
    functor(T, Name, Arity),
    format("name=~w arity=~w~n", [Name, Arity]),
    arg(1, T, X), arg(3, T, Colour),
    format("arg1=~w arg3=~w~n", [X, Colour]),
    T =.. List, format("univ: ~w~n", [List]),
    Built =.. [circle, 5], format("built: ~w~n", [Built]),
    functor(Fresh, pair, 2), format("fresh term: ~w~n", [Fresh]),

    forall(arg(N, T, A), format("  arg ~w = ~w~n", [N, A])),

    copy_term(f(X1, Y1, X1), Copy), format("copy shares variables: ~w~n", [Copy]),
    ( var(Y1) -> writeln("Y1 is unbound") ; true ),
    classify(foo, C1), classify(42, C2), classify(3.5, C3),
    classify("str", C4), classify(f(x), C5), classify([1], C6),
    format("~w ~w ~w ~w ~w ~w~n", [C1, C2, C3, C4, C5, C6]),
    term_to_atom(g(a, B, "x"), At), format("term_to_atom: ~w (~w)~n", [At, B]),
    term_variables(h(P, Q, P), Vars), length(Vars, NV), format("~w distinct variables~n", [NV]),
    setarg(1, T, 99), format("after setarg: ~w~n", [T]).

classify(X, atom)     :- atom(X), !.
classify(X, integer)  :- integer(X), !.
classify(X, float)    :- float(X), !.
classify(X, string)   :- string(X), !.
classify(X, list)     :- is_list(X), !.
classify(X, compound) :- compound(X), !.
classify(_, other).
