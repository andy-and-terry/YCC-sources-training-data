import std.stdio;
import std.container : DList;

void main() {
    DList!int queue;
    queue.insertBack(1);
    queue.insertBack(2);
    queue.insertBack(3);
    writeln(queue.front());
    queue.removeFront();
    writeln(queue.front());
}
