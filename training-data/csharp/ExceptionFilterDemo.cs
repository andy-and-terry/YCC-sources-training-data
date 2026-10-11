using System;
using System.IO;

class ExceptionFilterDemo
{
    static void Risky(int code)
    {
        switch (code)
        {
            case 1: throw new IOException("disk full", 28);
            case 2: throw new IOException("locked", 32);
            case 3: throw new ArgumentException("bad arg");
        }
    }

    static void Main()
    {
        foreach (int code in new[] { 1, 2, 3, 0 })
        {
            try
            {
                Risky(code);
                Console.WriteLine($"{code}: ok");
            }
            catch (IOException ex) when (ex.HResult == 28)
            {
                Console.WriteLine($"{code}: handled disk-full");
            }
            catch (IOException ex)
            {
                Console.WriteLine($"{code}: other IO error {ex.Message}");
            }
            catch (Exception ex) when (ex is ArgumentException or ArgumentNullException)
            {
                Console.WriteLine($"{code}: argument problem");
            }
        }
    }
}
