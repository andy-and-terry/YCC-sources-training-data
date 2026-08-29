:- numlist(1, 10, Numbers),
   include([N]>>(0 is N mod 2), Numbers, Evens),
   maplist([N,S]>>(S is N*N), Evens, Squares),
   sum_list(Squares, Total),
   writeln(Evens),
   writeln(Squares),
   writeln(Total).
