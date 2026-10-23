using System;
using System.Collections.Generic;

class JosephusProblem
{
    // Simulation using a linked list as a circle.
    static int SurvivorSimulated(int n, int k)
    {
        var circle = new LinkedList<int>();
        for (int i = 1; i <= n; i++) circle.AddLast(i);

        var node = circle.First!;
        while (circle.Count > 1)
        {
            for (int step = 1; step < k; step++)
                node = node.Next ?? circle.First!;
            var next = node.Next ?? circle.First!;
            circle.Remove(node);
            node = next;
        }
        return circle.First!.Value;
    }

    // Closed recurrence: J(1) = 0, J(n) = (J(n-1) + k) mod n.
    static int SurvivorRecurrence(int n, int k)
    {
        int result = 0;
        for (int i = 2; i <= n; i++)
            result = (result + k) % i;
        return result + 1;
    }

    static void Main()
    {
        foreach (var (n, k) in new[] { (7, 3), (41, 3), (10, 2) })
        {
            Console.WriteLine($"n={n}, k={k}: simulated={SurvivorSimulated(n, k)}, recurrence={SurvivorRecurrence(n, k)}");
        }
    }
}
