next_term(Term, Next) :-
    group_runs(Term, Runs),
    foldl(describe_run, Runs, [], RevParts),
    reverse(RevParts, Next).

group_runs([], []).
group_runs([X|Xs], [[X|Same]|Groups]) :-
    take_same(X, Xs, Same, Rest),
    group_runs(Rest, Groups).

take_same(X, [X|Xs], [X|Same], Rest) :- !, take_same(X, Xs, Same, Rest).
take_same(_, Rest, [], Rest).

describe_run([D|Same], Acc, [D, Count|Acc]) :-
    length([D|Same], Count).

print_terms(_, 0) :- !.
print_terms(Term, N) :-
    atomic_list_concat(Term, Atom),
    writeln(Atom),
    next_term(Term, Next),
    N1 is N - 1,
    print_terms(Next, N1).

:- print_terms([1], 7).
