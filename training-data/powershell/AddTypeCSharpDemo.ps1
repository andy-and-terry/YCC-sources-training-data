# Add-Type compiles inline C# so its static members can be called from PowerShell.
Add-Type -TypeDefinition @"
public static class Geometry
{
    public static double CircleArea(double radius)
    {
        return System.Math.PI * radius * radius;
    }

    public static int Gcd(int a, int b)
    {
        while (b != 0) { int t = b; b = a % b; a = t; }
        return a;
    }
}
"@

"{0:N3}" -f [Geometry]::CircleArea(2)
[Geometry]::Gcd(84, 36)

# Types can also be created with -MemberDefinition, which wraps the code in a class.
$type = Add-Type -Name MathExtras -Namespace Demo -PassThru -MemberDefinition @"
public static long Cube(long n) { return n * n * n; }
"@
[Demo.MathExtras]::Cube(7)
