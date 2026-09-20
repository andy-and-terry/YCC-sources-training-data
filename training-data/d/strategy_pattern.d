import std.stdio;
import std.algorithm : sort, reverse;

interface SortStrategy {
    void apply(ref int[] data);
}

class AscendingSort : SortStrategy {
    void apply(ref int[] data) {
        data.sort();
    }
}

class DescendingSort : SortStrategy {
    void apply(ref int[] data) {
        data.sort();
        data.reverse();
    }
}

class Sorter {
    private SortStrategy strategy;

    this(SortStrategy strategy) {
        this.strategy = strategy;
    }

    void setStrategy(SortStrategy strategy) {
        this.strategy = strategy;
    }

    void execute(ref int[] data) {
        strategy.apply(data);
    }
}

void main() {
    int[] data = [5, 3, 8, 1, 9, 2];

    auto sorter = new Sorter(new AscendingSort());
    sorter.execute(data);
    writeln(data);

    sorter.setStrategy(new DescendingSort());
    sorter.execute(data);
    writeln(data);
}
