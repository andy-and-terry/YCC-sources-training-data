interface Comparable<G> : Object {
    public abstract int compare_to(G other);
}

class Money : Object, Comparable<Money> {
    public int cents;

    public Money(int cents) {
        this.cents = cents;
    }

    public int compare_to(Money other) {
        return cents - other.cents;
    }
}

void insertion_sort(Money[] items) {
    for (int i = 1; i < items.length; i++) {
        Money key = items[i];
        int j = i - 1;
        while (j >= 0 && items[j].compare_to(key) > 0) {
            items[j + 1] = items[j];
            j--;
        }
        items[j + 1] = key;
    }
}

void main() {
    Money[] wallet = {
        new Money(250),
        new Money(75),
        new Money(1000),
        new Money(5),
    };

    insertion_sort(wallet);
    foreach (Money m in wallet) {
        stdout.printf("$%d.%02d\n", m.cents / 100, m.cents % 100);
    }
}
