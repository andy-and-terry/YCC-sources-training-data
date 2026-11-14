using System;

ReadOnlySpan<char> line = "key=value";
int i = line.IndexOf('=');
Console.WriteLine(line[..i].ToString() + " -> " + line[(i + 1)..].ToString());
