% permutation/2 generates every reordering of a list on backtracking;
% wrapping it in findall/3 collects them all, and extra goals in the
% generator filter down to the arrangements that satisfy a condition.
:- findall(P, permutation([1, 2, 3], P), Perms),
   writeln(Perms),
   length(Perms, Count),
   writeln(Count).

:- findall(P,
           (permutation([1, 2, 3, 4], P), P = [First|_], 0 is First mod 2),
           EvenFirst),
   writeln(EvenFirst).
