% The classic zebra puzzle: five houses in a row, each with a distinct
% color, nationality, drink, cigarette brand and pet, tied together by
% fifteen clues. nextto/3 (Y immediately follows X) encodes "right of"
% and "next to", and member/2 pins facts to some house without saying
% which. Solving it is just unifying all the clues against one list.
houses(Houses) :-
    Houses = [house(_, _, _, _, _), house(_, _, _, _, _), house(_, _, _, _, _),
              house(_, _, _, _, _), house(_, _, _, _, _)],
    member(house(red, english, _, _, _), Houses),
    member(house(_, spaniard, _, _, dog), Houses),
    member(house(green, _, coffee, _, _), Houses),
    member(house(_, ukrainian, tea, _, _), Houses),
    right_of(house(green, _, _, _, _), house(ivory, _, _, _, _), Houses),
    member(house(_, _, _, oldgold, snails), Houses),
    member(house(yellow, _, _, kools, _), Houses),
    nth1(3, Houses, house(_, _, milk, _, _)),
    nth1(1, Houses, house(_, norwegian, _, _, _)),
    next_to(house(_, _, _, chesterfields, _), house(_, _, _, _, fox), Houses),
    next_to(house(_, _, _, kools, _), house(_, _, _, _, horse), Houses),
    member(house(_, _, orangejuice, luckystrike, _), Houses),
    member(house(_, japanese, _, parliaments, _), Houses),
    next_to(house(_, norwegian, _, _, _), house(blue, _, _, _, _), Houses).

right_of(Right, Left, Houses) :- nextto(Left, Right, Houses).
next_to(A, B, Houses) :- nextto(A, B, Houses).
next_to(A, B, Houses) :- nextto(B, A, Houses).

zebra(WaterDrinker, ZebraOwner) :-
    houses(Houses),
    member(house(_, WaterDrinker, water, _, _), Houses),
    member(house(_, ZebraOwner, _, _, zebra), Houses).

:- zebra(Water, Zebra),
   format("water drinker: ~w~n", [Water]),
   format("zebra owner: ~w~n", [Zebra]).
