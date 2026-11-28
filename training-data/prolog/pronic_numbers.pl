pronic(N, P) :- P is N * (N + 1).

is_pronic(X) :-
    N is floor(sqrt(X)),
    X =:= N * (N + 1).

% ?- findall(P, (between(0, 9, N), pronic(N, P)), L).
% L = [0, 2, 6, 12, 20, 30, 42, 56, 72, 90].
% ?- is_pronic(56).   % true
% ?- is_pronic(57).   % false
