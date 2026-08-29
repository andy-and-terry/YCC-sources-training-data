color(red). color(green). color(blue). color(red).

:- findall(C, color(C), All), writeln(All).
:- setof(C, color(C), Unique), writeln(Unique).
