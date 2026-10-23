:- use_module(library(error)).

safe_sqrt(X, Y) :-
    must_be(nonneg, X),
    Y is sqrt(X).

check(Goal) :-
    catch(( call(Goal), format("ok: ~q~n", [Goal]) ),
          error(Err, _),
          format("error: ~q~n", [Err])).

:- check(safe_sqrt(16, _)).
:- check(safe_sqrt(-4, _)).
:- check(safe_sqrt(abc, _)).
:- check(safe_sqrt(_, _)).
:- check(must_be(list(integer), [1, 2, 3])).
:- check(must_be(list(integer), [1, a, 3])).
:- check(must_be(boolean, true)).
:- check(must_be(oneof([red, green]), blue)).
:- check(is_of_type(positive_integer, 5)).
