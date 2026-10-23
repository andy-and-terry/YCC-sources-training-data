:- use_module(library(solution_sequences)).

city(paris, france, 2100).
city(lyon, france, 500).
city(berlin, germany, 3600).
city(munich, germany, 1500).
city(rome, italy, 2800).

country(C) :- city(_, C, _).

% distinct/1 removes duplicate solutions.
:- findall(C, distinct(C, country(C)), Cs), writeln(Cs).

% order_by/2 sorts solutions without findall + sort.
:- findall(Name-Pop, order_by([desc(Pop)], city(Name, _, Pop)), L), writeln(L).
:- findall(Name, order_by([asc(Name)], city(Name, _, _)), Names), writeln(Names).

% offset/2 and limit/2 give pagination.
:- findall(Name, limit(2, offset(1, order_by([asc(Name)], city(Name, _, _)))), Page), writeln(Page).
