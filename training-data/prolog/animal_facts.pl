mammal(dog).
mammal(cat).
mammal(whale).
bird(eagle).
bird(sparrow).

can_fly(bird(_)).
warm_blooded(X) :- mammal(X).
warm_blooded(X) :- bird(X).

:- findall(X, warm_blooded(X), Animals), writeln(Animals).
