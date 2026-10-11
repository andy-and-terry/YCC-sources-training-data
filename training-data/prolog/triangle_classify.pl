triangle(A, B, C, Type) :-
    msort([A, B, C], [S1, S2, S3]),
    (   ( S1 =< 0 ; S1 + S2 =< S3 )
    ->  Type = not_a_triangle
    ;   S1 =:= S3
    ->  Type = equilateral
    ;   ( S1 =:= S2 ; S2 =:= S3 )
    ->  Type = isosceles
    ;   Type = scalene
    ).

:- forall(member(T, [[3,3,3], [3,3,5], [3,4,5], [1,2,3], [0,1,1]]),
          ( T = [A,B,C], triangle(A, B, C, Type), format("~w: ~w~n", [T, Type]) )).
