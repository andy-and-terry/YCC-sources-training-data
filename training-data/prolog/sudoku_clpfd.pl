:- use_module(library(clpfd)).

blocks([], []).
blocks([A, B|Rs], [C, D|Cs]) :-
    all_different([A, B, C, D]),
    blocks(Rs, Cs).

sudoku4(Rows) :-
    length(Rows, 4),
    maplist(same_length(Rows), Rows),
    append(Rows, Vs),
    Vs ins 1..4,
    maplist(all_different, Rows),
    transpose(Rows, Columns),
    maplist(all_different, Columns),
    Rows = [R1, R2, R3, R4],
    blocks(R1, R2),
    blocks(R3, R4),
    maplist(label, Rows).

:- Rows = [[1, _, _, _],
           [_, _, 1, _],
           [_, 1, _, _],
           [_, _, _, 1]],
   sudoku4(Rows),
   maplist(writeln, Rows).
