report(Term) :-
    (   var(Term)    -> Kind = variable
    ;   atom(Term)   -> Kind = atom
    ;   integer(Term) -> Kind = integer
    ;   float(Term)  -> Kind = float
    ;   string(Term) -> Kind = string
    ;   is_list(Term) -> Kind = list
    ;   compound(Term) -> Kind = compound
    ),
    (   ground(Term) -> G = ground ; G = 'has variables' ),
    format("~q: ~w, ~w~n", [Term, Kind, G]).

:- forall(member(T, [_, foo, 42, 2.5, "text", [1, 2], [1, _], f(a, b), g(_, b)]),
          report(T)).

:- term_variables(f(X, g(Y, X), Z), Vars), length(Vars, N), writeln(N).
:- callable(foo(1)), \+ callable(3), writeln(callable_ok).
