import std.stdio;
import std.algorithm : remove;
import std.range : iota;
import std.array : array;

// Simulate eliminating every k-th person; return elimination order.
int[] eliminationOrder(int n, int k)
{
    auto people = iota(1, n + 1).array;
    int[] order;
    size_t idx = 0;
    while (people.length > 0)
    {
        idx = (idx + k - 1) % people.length;
        order ~= people[idx];
        people = people.remove(idx);
    }
    return order;
}

// Recurrence: J(1) = 0, J(i) = (J(i-1) + k) % i, answer is 1-based.
int survivor(int n, int k)
{
    int result = 0;
    foreach (i; 2 .. n + 1)
        result = (result + k) % i;
    return result + 1;
}

void main()
{
    auto order = eliminationOrder(7, 3);
    writeln("Elimination order: ", order);
    writeln("Survivor (simulation): ", order[$ - 1]);
    writeln("Survivor (recurrence): ", survivor(7, 3));
    writeln("n=41, k=3 survivor: ", survivor(41, 3));
}
