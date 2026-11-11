using System;
using System.Text;

class AddBinaryStrings
{
    static string AddBinary(string a, string b)
    {
        var sb = new StringBuilder();
        int i = a.Length - 1, j = b.Length - 1, carry = 0;
        while (i >= 0 || j >= 0 || carry > 0)
        {
            int sum = carry;
            if (i >= 0) sum += a[i--] - '0';
            if (j >= 0) sum += b[j--] - '0';
            sb.Insert(0, sum % 2);
            carry = sum / 2;
        }
        return sb.ToString();
    }

    static void Main() => Console.WriteLine(AddBinary("1010", "1011")); // 10101
}
