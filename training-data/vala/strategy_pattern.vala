interface SortStrategy : Object {
    public abstract void sort(int[] values);
}

class AscendingSort : Object, SortStrategy {
    public void sort(int[] values) {
        for (int i = 1; i < values.length; i++) {
            int key = values[i];
            int j = i - 1;
            while (j >= 0 && values[j] > key) {
                values[j + 1] = values[j];
                j--;
            }
            values[j + 1] = key;
        }
    }
}

class DescendingSort : Object, SortStrategy {
    public void sort(int[] values) {
        for (int i = 1; i < values.length; i++) {
            int key = values[i];
            int j = i - 1;
            while (j >= 0 && values[j] < key) {
                values[j + 1] = values[j];
                j--;
            }
            values[j + 1] = key;
        }
    }
}

class SortContext : Object {
    SortStrategy strategy;

    public SortContext(SortStrategy strategy) {
        this.strategy = strategy;
    }

    public void set_strategy(SortStrategy strategy) {
        this.strategy = strategy;
    }

    public void execute(int[] values) {
        strategy.sort(values);
    }
}

void print_array(int[] values) {
    string result = "";
    for (int i = 0; i < values.length; i++) {
        if (i > 0) {
            result += ", ";
        }
        result += values[i].to_string();
    }
    stdout.printf("%s\n", result);
}

void main() {
    int[] values = { 5, 2, 8, 1, 9, 3 };

    var context = new SortContext(new AscendingSort());
    context.execute(values);
    print_array(values);

    context.set_strategy(new DescendingSort());
    context.execute(values);
    print_array(values);
}
