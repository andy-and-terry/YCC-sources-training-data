using System;

class ModularExponentiation
{
    static long Power(long baseVal, long exponent, long modulus)
    {
        long result = 1;
        baseVal %= modulus;
        while (exponent > 0)
        {
            if ((exponent & 1) == 1) result = result * baseVal % modulus;
            exponent >>= 1;
            baseVal = baseVal * baseVal % modulus;
        }
        return result;
    }

    static void Main()
    {
        Console.WriteLine(Power(2, 10, 1000));
        Console.WriteLine(Power(7, 128, 13));
    }
}
