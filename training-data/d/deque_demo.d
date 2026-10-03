import std.stdio;
import std.container : DList;
import std.array;

void main() {
    auto deque = DList!int();
    deque.insertBack(1);
    deque.insertBack(2);
    deque.insertFront(0);
    writeln(deque.array);

    int front = deque.front;
    deque.removeFront();
    writeln(front);

    int back = deque.back;
    deque.removeBack();
    writeln(back);

    writeln(deque.array);
}
