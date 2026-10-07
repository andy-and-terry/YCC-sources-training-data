using System;

static class FuncCombinators
{
    public static Predicate<T> And<T>(this Predicate<T> first, Predicate<T> second) =>
        item => first(item) && second(item);

    public static Predicate<T> Or<T>(this Predicate<T> first, Predicate<T> second) =>
        item => first(item) || second(item);

    public static Func<TIn, TOut2> Then<TIn, TOut1, TOut2>(this Func<TIn, TOut1> first, Func<TOut1, TOut2> second) =>
        input => second(first(input));
}

class FuncPredicateComposition
{
    static void Main()
    {
        Predicate<int> isEven = n => n % 2 == 0;
        Predicate<int> isPositive = n => n > 0;

        Predicate<int> isPositiveEven = isEven.And(isPositive);
        Predicate<int> isEvenOrPositive = isEven.Or(isPositive);

        foreach (int n in new[] { -4, -3, 2, 5, 8 })
            Console.WriteLine($"{n}: positiveEven={isPositiveEven(n)} evenOrPositive={isEvenOrPositive(n)}");

        Func<int, int> square = x => x * x;
        Func<int, string> describe = x => $"value={x}";
        Func<int, string> squareThenDescribe = square.Then(describe);

        Console.WriteLine(squareThenDescribe(6));
    }
}
