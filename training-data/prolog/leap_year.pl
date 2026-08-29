is_leap_year(Year) :-
    (0 is Year mod 4, \+ (0 is Year mod 100)) ; 0 is Year mod 400.

:- (is_leap_year(2000) -> writeln(true) ; writeln(false)).
:- (is_leap_year(1900) -> writeln(true) ; writeln(false)).
:- (is_leap_year(2024) -> writeln(true) ; writeln(false)).
