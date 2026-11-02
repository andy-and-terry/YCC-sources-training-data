classify(N, neg) :- N < 0, !.
classify(0, zero) :- !.
classify(_, pos).

% ?- classify(-3, X).
