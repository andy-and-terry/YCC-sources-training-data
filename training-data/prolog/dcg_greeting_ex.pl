greeting --> [hello], name.
name --> [world].
name --> [prolog].

:- ( phrase(greeting, [hello, prolog]) -> writeln(ok) ; writeln(fail) ).
digits([D|T]) --> [D], { code_type(D, digit) }, digits(T).
digits([D]) --> [D], { code_type(D, digit) }.
