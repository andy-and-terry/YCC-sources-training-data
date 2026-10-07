import std.stdio;
import std.container.rbtree;
import std.array : array;

void main() {
    auto tree = redBlackTree!int(5, 1, 9, 3, 7);
    tree.insert(4);
    tree.insert(5);              // duplicate ignored
    writeln(tree[].array);
    writeln(tree.length);
    writeln(tree.front, " ", tree.back);
    writeln(3 in tree);
    tree.removeKey(3);
    writeln(tree[].array);
    writeln(tree.upperBound(5).array);
    writeln(tree.lowerBound(5).array);
}
