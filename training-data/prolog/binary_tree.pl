insert_bst(nil, Value, node(Value, nil, nil)).
insert_bst(node(V, L, R), Value, node(V, L2, R)) :-
    Value < V, !,
    insert_bst(L, Value, L2).
insert_bst(node(V, L, R), Value, node(V, L, R2)) :-
    Value > V, !,
    insert_bst(R, Value, R2).
insert_bst(Tree, _, Tree).

inorder(nil, []).
inorder(node(V, L, R), List) :-
    inorder(L, LList),
    inorder(R, RList),
    append(LList, [V|RList], List).

build_tree([], Tree, Tree).
build_tree([H|T], Acc, Tree) :-
    insert_bst(Acc, H, Acc2),
    build_tree(T, Acc2, Tree).

:- build_tree([5,3,8,1,4,7,9], nil, Tree), inorder(Tree, List), writeln(List).
