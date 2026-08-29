greeting --> [hello], [world].

:- (phrase(greeting, [hello, world]) -> writeln(true) ; writeln(false)).
:- (phrase(greeting, [goodbye, world]) -> writeln(true) ; writeln(false)).
