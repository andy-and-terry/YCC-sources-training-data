% setup_call_cleanup/3 guarantees the cleanup goal runs, even on failure or exception.
:- setup_call_cleanup(writeln(open), writeln(work), writeln(close)).

:- ( setup_call_cleanup(writeln(open), fail, writeln(close))
   -> true ; writeln('goal failed') ).

:- catch(setup_call_cleanup(writeln(open), throw(oops), writeln(close)),
         E, format("caught ~w~n", [E])).

with_memory_stream(Text) :-
    setup_call_cleanup(
        open_string("alpha\nbeta\n", In),
        ( read_line_to_string(In, Text) ),
        close(In)).

:- with_memory_stream(T), writeln(T).
