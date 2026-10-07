:- dynamic(score/2).

add_score(Player, Points) :-
    ( retract(score(Player, Old)) -> New is Old + Points ; New is Points ),
    assertz(score(Player, New)).

:- add_score(alice, 10),
   add_score(bob, 5),
   add_score(alice, 7),
   findall(P-S, score(P, S), Scores),
   writeln(Scores).

:- retractall(score(_, _)),
   findall(P-S, score(P, S), Remaining),
   writeln(Remaining).
