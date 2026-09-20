:- op(700, xfx, ===>).

(rainy ===> bring_umbrella).
(sunny ===> wear_sunglasses).

advice(Weather, Action) :-
    (Weather ===> Action).

:- advice(rainy, Action), writeln(Action).
:- findall(W-A, (W ===> A), Rules), writeln(Rules).
