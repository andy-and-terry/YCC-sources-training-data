grid_cell(0, 0, 1). grid_cell(0, 1, 1). grid_cell(0, 2, 0). grid_cell(0, 3, 0).
grid_cell(1, 0, 1). grid_cell(1, 1, 1). grid_cell(1, 2, 0). grid_cell(1, 3, 0).
grid_cell(2, 0, 0). grid_cell(2, 1, 0). grid_cell(2, 2, 1). grid_cell(2, 3, 0).
grid_cell(3, 0, 0). grid_cell(3, 1, 0). grid_cell(3, 2, 0). grid_cell(3, 3, 1).

grid_size(4, 4).

visit(R, C, Visited0, Visited) :-
    grid_cell(R, C, 1),
    \+ member(R-C, Visited0),
    !,
    grid_size(Rows, Cols),
    Visited1 = [R-C|Visited0],
    UpR is R - 1, DownR is R + 1, LeftC is C - 1, RightC is C + 1,
    ( UpR >= 0 -> visit(UpR, C, Visited1, Visited2) ; Visited2 = Visited1 ),
    ( DownR < Rows -> visit(DownR, C, Visited2, Visited3) ; Visited3 = Visited2 ),
    ( LeftC >= 0 -> visit(R, LeftC, Visited3, Visited4) ; Visited4 = Visited3 ),
    ( RightC < Cols -> visit(R, RightC, Visited4, Visited) ; Visited = Visited4 ).
visit(_, _, Visited, Visited).

count_islands(Count) :-
    grid_size(Rows, Cols),
    RowMax is Rows - 1,
    ColMax is Cols - 1,
    findall(R-C, (between(0, RowMax, R), between(0, ColMax, C),
                  grid_cell(R, C, 1)), Lands),
    count_islands_helper(Lands, [], Count).

count_islands_helper([], _, 0).
count_islands_helper([R-C|Rest], Visited, Count) :-
    ( member(R-C, Visited)
    -> count_islands_helper(Rest, Visited, Count)
    ;  visit(R, C, Visited, Visited1),
       count_islands_helper(Rest, Visited1, RestCount),
       Count is RestCount + 1
    ).

:- count_islands(Count), writeln(Count).
