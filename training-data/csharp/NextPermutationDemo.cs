using System;

class NextPermutationDemo
{
    static int[] NextPermutation(int[] nums)
    {
        var arr = (int[])nums.Clone();
        int i = arr.Length - 2;
        while (i >= 0 && arr[i] >= arr[i + 1]) i--;
        if (i >= 0)
        {
            int j = arr.Length - 1;
            while (arr[j] <= arr[i]) j--;
            (arr[i], arr[j]) = (arr[j], arr[i]);
        }
        Array.Reverse(arr, i + 1, arr.Length - i - 1);
        return arr;
    }

    static void Main()
    {
        Console.WriteLine(string.Join(" ", NextPermutation(new[] { 1, 2, 3 })));
        Console.WriteLine(string.Join(" ", NextPermutation(new[] { 3, 2, 1 })));
    }
}
