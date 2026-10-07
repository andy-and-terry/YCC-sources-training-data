% Trapping rain water: water above each bar is bounded by the shorter
% of the tallest bar to its left and the tallest bar to its right.
prefix_max([], _, []).
prefix_max([H|T], Running, [M|Rest]) :-
    M is max(H, Running),
    prefix_max(T, M, Rest).

trapped_water(Heights, Total) :-
    prefix_max(Heights, 0, LeftMax),
    reverse(Heights, RevHeights),
    prefix_max(RevHeights, 0, RevRightMax),
    reverse(RevRightMax, RightMax),
    sum_trapped(Heights, LeftMax, RightMax, Total).

sum_trapped([], [], [], 0).
sum_trapped([H|Hs], [L|Ls], [R|Rs], Total) :-
    sum_trapped(Hs, Ls, Rs, Rest),
    Level is min(L, R) - H,
    Total is Rest + Level.

:- trapped_water([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1], Total), writeln(Total).
