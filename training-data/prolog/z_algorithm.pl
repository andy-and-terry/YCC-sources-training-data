% Z-algorithm: Z[i] is the length of the longest common prefix of the
% whole string and the suffix starting at i. Built with a mutable
% functor-based array (nb_setarg) so each position is filled once in
% a single left-to-right pass using the [Left,Right] match window.
z_algorithm(Codes, ZList) :-
    length(Codes, N),
    functor(Z, z, N),
    forall(between(1, N, K), nb_setarg(K, Z, 0)),
    z_fill(Codes, Z, N, 1, 0, 0),
    Z =.. [z|ZList].

z_fill(_, _, N, I, _, _) :- I >= N, !.
z_fill(Codes, Z, N, I, Left, Right) :-
    I < N,
    ( I =< Right
    -> arg(I - Left + 1, Z, Mirror), Base is min(Right - I + 1, Mirror)
    ;  Base = 0
    ),
    extend_z(Codes, N, I, Base, Zi),
    nb_setarg(I + 1, Z, Zi),
    ( I + Zi - 1 > Right -> NewLeft = I, NewRight is I + Zi - 1 ; NewLeft = Left, NewRight = Right ),
    I1 is I + 1,
    z_fill(Codes, Z, N, I1, NewLeft, NewRight).

extend_z(Codes, N, I, Z0, Z) :-
    Pos2 is I + Z0,
    ( Pos2 < N, nth0(Z0, Codes, C), nth0(Pos2, Codes, C)
    -> Z1 is Z0 + 1, extend_z(Codes, N, I, Z1, Z)
    ;  Z = Z0
    ).

z_search(Text, Pattern, Positions) :-
    string_concat(Pattern, "$", Combined0),
    string_concat(Combined0, Text, Combined),
    string_codes(Combined, Codes),
    z_algorithm(Codes, ZList),
    string_length(Pattern, PatLen),
    findall(Pos,
        ( nth0(Idx, ZList, PatLen), Pos is Idx - PatLen - 1, Pos >= 0 ),
        Positions).

:- z_search("ababcabcabababd", "abab", Positions), writeln(Positions).
