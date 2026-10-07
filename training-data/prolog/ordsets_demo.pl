:- use_module(library(ordsets)).

:- list_to_ord_set([c, a, b, a], S), writeln(S).
:- ord_union([a, c], [b, c, d], U), writeln(U).
:- ord_intersection([a, b, c], [b, c, d], I), writeln(I).
:- ord_subtract([a, b, c], [b], D), writeln(D).
:- ord_memberchk(b, [a, b, c]) -> writeln(member) ; writeln(absent).
:- ord_add_element([a, c], b, S), writeln(S).
:- ord_del_element([a, b, c], b, S), writeln(S).
:- ( ord_subset([a, b], [a, b, c]) -> writeln(subset) ; writeln(no) ).
:- ord_symdiff([a, b], [b, c], S), writeln(S).
