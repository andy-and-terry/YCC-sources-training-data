import std.stdio;
import std.algorithm : minElement, maxElement, minIndex, maxIndex;

struct Item {
    string name;
    int price;
}

void main() {
    int[] data = [5, 3, 8, 1, 9, 2];
    writeln(data.minElement);
    writeln(data.maxElement);
    writeln(data.minIndex);
    writeln(data.maxIndex);

    auto items = [Item("pen", 3), Item("book", 12), Item("cup", 7)];
    writeln(items.minElement!(i => i.price).name);
    writeln(items.maxElement!(i => i.price).name);
}
