:- use_module(library(debug)).

% assertion/1 succeeds silently when its goal holds and raises an
% assertion_failed exception (after printing a backtrace) when it does not.

average(List, Avg) :-
    assertion(List \== []),
    assertion(is_list(List)),
    sum_list(List, Sum),
    length(List, N),
    Avg is Sum / N.

positive_all(List) :-
    forall(member(X, List), assertion(X > 0)).

check(Goal) :-
    catch(( call(Goal) -> format("passed: ~q~n", [Goal])
          ; format("failed: ~q~n", [Goal]) ),
          E,
          format("assertion failed in ~q: ~q~n", [Goal, E])).

:- check(average([2, 4, 6], _)).
:- check(positive_all([1, 2, 3])).
:- check(positive_all([1, -2, 3])).
:- check(average([], _)).

% assertion/1 versus plain failure: a normal goal just fails
:- ( member(x, [a, b]) -> true ; writeln('member/2 failed quietly') ).
