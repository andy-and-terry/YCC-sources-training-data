% must_be/2 validates arguments and throws standard ISO-style errors.

safe_sqrt(X, Y) :-
    must_be(nonneg, X),
    Y is sqrt(X).

repeat_atom(Atom, N, List) :-
    must_be(atom, Atom),
    must_be(positive_integer, N),
    length(List, N),
    maplist(=(Atom), List).

sum_ints(List, Sum) :-
    must_be(list(integer), List),
    sum_list(List, Sum).

try(Goal) :-
    catch(( call(Goal), format("ok:    ~q~n", [Goal]) ),
          error(Formal, _),
          format("error: ~q -> ~q~n", [Goal, Formal])).

:- try(safe_sqrt(16, _)).
:- try(safe_sqrt(-4, _)).
:- try(safe_sqrt(_, _)).
:- try(safe_sqrt(abc, _)).
:- try(repeat_atom(x, 3, _)).
:- try(repeat_atom("x", 3, _)).
:- try(repeat_atom(x, 0, _)).
:- try(sum_ints([1, 2, 3], _)).
:- try(sum_ints([1, two, 3], _)).
:- try(sum_ints(notalist, _)).

% is_of_type/2 tests without throwing
:- forall(member(T-V, [integer-3, integer-a, boolean-true, oneof([a,b])-c, between(1,5)-9]),
          ( is_of_type(T, V) -> format("~q is ~q~n", [V, T])
          ; format("~q is not ~q~n", [V, T]) )).
