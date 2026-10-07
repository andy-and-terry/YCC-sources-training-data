% library(assoc): AVL-tree-backed key-value maps with O(log n) lookup and
% update, an alternative to plain association lists for larger key sets.
:- use_module(library(assoc)).

:- list_to_assoc([alice-30, bob-25, carol-35], Ages),
   get_assoc(bob, Ages, BobAge),
   writeln(BobAge),
   put_assoc(dave, Ages, 40, Ages2),
   assoc_to_list(Ages2, Pairs),
   writeln(Pairs),
   assoc_to_keys(Ages2, Keys),
   writeln(Keys),
   assoc_to_values(Ages2, Values),
   writeln(Values).

:- empty_assoc(Empty),
   ( get_assoc(missing, Empty, _)
   -> writeln(found)
   ;  writeln(not_found)
   ).
