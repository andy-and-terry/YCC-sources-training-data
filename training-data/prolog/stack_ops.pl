stack_push(Item, Stack, [Item|Stack]).

stack_pop([Top|Rest], Top, Rest).

stack_peek([Top|_], Top).

stack_empty([]).

:- stack_push(1, [], S1),
   stack_push(2, S1, S2),
   stack_push(3, S2, S3),
   stack_pop(S3, Top, S4),
   writeln(Top),
   writeln(S4).
