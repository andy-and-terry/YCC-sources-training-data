greeting --> [hello], name.
name --> [world].
name --> [prolog].

main :- ( phrase(greeting, [hello, prolog]) -> writeln(yes) ; writeln(no) ),
        append(X, [3], [1, 2, 3]), writeln(X).
:- initialization(main).
