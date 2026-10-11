using System;
using System.IO;
using System.Linq;

class FileIoTempDemo
{
    static void Main()
    {
        string path = Path.GetTempFileName();
        try
        {
            File.WriteAllLines(path, new[] { "alpha", "beta", "gamma" });
            File.AppendAllText(path, "delta" + Environment.NewLine);

            Console.WriteLine(File.ReadAllLines(path).Length);
            Console.WriteLine(File.ReadLines(path).Where(l => l.Contains('a')).Count());

            using (var reader = new StreamReader(path))
            {
                string? line;
                while ((line = reader.ReadLine()) != null)
                    Console.WriteLine(line.ToUpper());
            }

            Console.WriteLine(new FileInfo(path).Length > 0);
        }
        finally
        {
            File.Delete(path);
            Console.WriteLine(File.Exists(path));
        }
    }
}
