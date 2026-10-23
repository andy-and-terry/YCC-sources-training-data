:- dynamic fact/2, rule/1.

fact(apple, red).
fact(banana, yellow).
fact(grape, purple).

rule(X) :- fact(X, C), C \== red, atom_length(X, L), L > 5.

% portray_clause writes a term as re-readable source code
:- portray_clause(fact(apple, red)).
:- portray_clause((head(X, Y) :- body1(X, Z), \+ body2(Z), Y is Z + 1)).
:- portray_clause([1, 'two words', "a string", f(_A, _B, _A)]).

% listing/1 prints all clauses for a predicate
:- listing(fact/2).
:- listing(rule/1).

% clause/2 inspects a rule body at run time
:- clause(rule(X), Body), portray_clause(rule(X) :- Body).

% assert then list again
:- assertz(fact(kiwi, green)), listing(fact/2).
