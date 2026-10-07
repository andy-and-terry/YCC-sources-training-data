% Inspecting and building terms at runtime.
:- functor(foo(a, b, c), Name, Arity), writeln(Name/Arity).
:- functor(T, point, 2), writeln(T).
:- arg(2, foo(a, b, c), X), writeln(X).
:- foo(a, b) =.. L, writeln(L).
:- T =.. [bar, 1, 2], writeln(T).
:- copy_term(f(X, Y, X), C), writeln(C).
:- T = f(_, g(_), a), term_variables(T, Vs), length(Vs, N), writeln(N).
:- ( atom(foo) -> writeln(atom) ; true ),
   ( compound(f(x)) -> writeln(compound) ; true ),
   ( var(_) -> writeln(var) ; true ),
   ( is_list([a]) -> writeln(list) ; true ).
:- setarg(1, f(a, b), z) -> true ; true.
:- T = f(a, b), setarg(1, T, z), writeln(T).
