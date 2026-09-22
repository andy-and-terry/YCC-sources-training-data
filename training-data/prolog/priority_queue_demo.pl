% A minimal priority queue as a Priority-sorted Item-Priority list, with
% insert keeping the list ordered so the minimum is always the head.
pq_empty([]).

pq_insert(Item-Priority, [], [Item-Priority]).
pq_insert(Item-Priority, [H-P|T], [Item-Priority, H-P|T]) :-
    Priority =< P, !.
pq_insert(Item-Priority, [H-P|T], [H-P|Rest]) :-
    pq_insert(Item-Priority, T, Rest).

pq_extract_min([Item-Priority|Rest], Item-Priority, Rest).

:- pq_empty(PQ0),
   pq_insert(task_c-3, PQ0, PQ1),
   pq_insert(task_a-1, PQ1, PQ2),
   pq_insert(task_b-2, PQ2, PQ3),
   pq_insert(task_d-1, PQ3, PQ4),
   writeln(PQ4),
   pq_extract_min(PQ4, Min, Rest),
   writeln(Min),
   writeln(Rest).
