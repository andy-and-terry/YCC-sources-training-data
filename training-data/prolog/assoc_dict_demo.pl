:- use_module(library(assoc)).

:- list_to_assoc([alice-30, bob-25, carol-35], Ages0),
   put_assoc(dave, Ages0, 40, Ages),
   get_assoc(bob, Ages, BobAge),
   format("bob is ~w~n", [BobAge]),
   assoc_to_list(Ages, Sorted),
   writeln(Sorted).
