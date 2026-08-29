circular_push(Data, Capacity, Size, Start, Value, NewData, NewSize, NewStart) :-
    Index is (Start + Size) mod Capacity,
    nb_setarg(1, Data, Index, Value),
    ( Size < Capacity
    -> NewSize is Size + 1, NewStart = Start
    ;  NewSize = Size, NewStart is (Start + 1) mod Capacity
    ).

:- writeln('circular buffer demo: array-based simulation with wraparound indexing').
