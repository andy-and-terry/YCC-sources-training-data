import std.stdio;
import std.getopt;

void main()
{
    // Normally this would be main(string[] args); here we use a fixed array.
    string[] args = ["prog", "--count=3", "-v", "--name", "zed", "extra"];

    int count = 1;
    bool verbose;
    string name = "anon";

    auto result = getopt(args,
        "count", "How many times", &count,
        "v|verbose", "Verbose output", &verbose,
        "name", "Who to greet", &name);

    if (result.helpWanted)
        defaultGetoptPrinter("Options:", result.options);

    foreach (i; 0 .. count)
        writeln("hello ", name, verbose ? " (verbose)" : "");
    writeln("remaining: ", args);
}
