% LRU cache over dynamic cache_entry/3 facts (Key, Value, LastUsedTick),
% evicting the lowest tick once capacity is exceeded.
:- dynamic(cache_entry/3).
:- dynamic(cache_tick/1).

cache_tick(0).

lru_init :- retractall(cache_entry(_, _, _)), retractall(cache_tick(_)), assertz(cache_tick(0)).

next_tick(T) :- retract(cache_tick(T0)), T is T0 + 1, assertz(cache_tick(T)).

lru_put(Capacity, Key, Value) :-
    retractall(cache_entry(Key, _, _)),
    next_tick(T),
    assertz(cache_entry(Key, Value, T)),
    evict_if_needed(Capacity).

lru_get(Key, Value) :-
    cache_entry(Key, Value, _),
    next_tick(T),
    retract(cache_entry(Key, Value, _)),
    assertz(cache_entry(Key, Value, T)).

evict_if_needed(Capacity) :-
    findall(K, cache_entry(K, _, _), Keys),
    length(Keys, N),
    ( N =< Capacity -> true
    ; findall(Tick-K, cache_entry(K, _, Tick), Ticks),
      keysort(Ticks, [_-Oldest|_]),
      retract(cache_entry(Oldest, _, _))
    ).

:- lru_init,
   lru_put(2, 1, a),
   lru_put(2, 2, b),
   lru_get(1, _),
   lru_put(2, 3, c),
   findall(K, cache_entry(K, _, _), Remaining),
   writeln(Remaining).
