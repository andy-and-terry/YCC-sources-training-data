append_dl(A-B, B-C, A-C).

:- append_dl([1,2|T1]-T1, [3,4|T2]-T2, R-[]), write(R), nl.
