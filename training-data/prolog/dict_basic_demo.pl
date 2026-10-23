% SWI-Prolog dicts
:- D = point{x: 1, y: 2}, X = D.x, writeln(X).
:- D = point{x: 1, y: 2}, D2 = D.put(z, 3), writeln(D2).
:- D = _{name: "Ann", age: 30}, get_dict(age, D, A), writeln(A).
:- D = _{a: 1, b: 2}, dict_pairs(D, Tag, Pairs), writeln(Tag-Pairs).
:- dict_pairs(D, config, [host-"localhost", port-8080]), writeln(D.port).
:- D = _{a: 1}, ( get_dict(zzz, D, _) -> writeln(found) ; writeln(missing) ).
