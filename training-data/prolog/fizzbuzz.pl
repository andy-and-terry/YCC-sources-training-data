fizzbuzz(N) :-
    ( 0 is N mod 15 -> writeln('FizzBuzz')
    ; 0 is N mod 3 -> writeln('Fizz')
    ; 0 is N mod 5 -> writeln('Buzz')
    ; writeln(N)
    ).

:- forall(between(1, 20, N), fizzbuzz(N)).
