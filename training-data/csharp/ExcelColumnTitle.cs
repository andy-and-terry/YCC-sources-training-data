using System;
using System.Text;

class ExcelColumnTitle
{
    static string Title(int n)
    {
        var sb = new StringBuilder();
        while (n > 0)
        {
            n--;
            sb.Insert(0, (char)('A' + n % 26));
            n /= 26;
        }
        return sb.ToString();
    }

    static void Main() => Console.WriteLine($"{Title(28)} {Title(701)}"); // AB ZY
}
