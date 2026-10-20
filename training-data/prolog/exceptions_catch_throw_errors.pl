safe_div(X, Y, Z) :- catch(Z is X / Y, error(evaluation_error(zero_divisor), _), (Z = inf)).

check_age(A) :- ( \+ integer(A) -> throw(error(type_error(integer, A), _)) ; A < 0 -> throw(error(domain_error(non_negative, A), _)) ; true ).

main :-
    safe_div(10, 2, A), safe_div(1, 0, B), format("~w ~w~n", [A, B]),
    forall(member(V, [5, -1, abc]),
           catch(( check_age(V), format("~w ok~n", [V]) ),
                 error(E, _),
                 format("~w -> ~w~n", [V, E]))),
    catch(atom_length(X, _), error(instantiation_error, _), writeln(inst_error)), ( var(X) -> true ; true ),
    catch(number_codes(_, "abc"), error(syntax_error(S), _), format("syntax ~w~n", [S])),
    catch(throw(my_exception(42)), my_exception(C), format("custom ~w~n", [C])),
    catch(call_with_depth_limit(true, 10, _), _, true),
    setup_call_cleanup(writeln(setup), writeln(call), writeln(cleanup)),
    catch(setup_call_cleanup(true, throw(oops), writeln(cleanup_on_throw)), oops, writeln(caught_oops)),
    catch(succ(P, 0), error(Err, _), (print_message(silent, Err), writeln(succ_failed))), ( var(P) -> true ; true ),
    ( catch(fail, _, true) -> true ; writeln(failed_not_error) ).
:- initialization(main).
