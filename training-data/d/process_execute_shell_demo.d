import std.stdio;
import std.process;
import std.string : strip, splitLines;

void main() {
    // executeShell runs a command line through the shell
    auto result = executeShell("echo hello from shell");
    writeln("status: ", result.status);
    writeln("output: ", result.output.strip);

    // execute runs a program directly with an argument array
    auto r2 = execute(["echo", "direct", "call"]);
    writeln(r2.output.strip);

    // Non-zero exit codes are reported, not thrown
    auto bad = executeShell("exit 4");
    writeln("exit code: ", bad.status);

    // Environment variables
    environment["DEMO_VAR"] = "42";
    auto env = executeShell("echo $DEMO_VAR");
    writeln(env.output.strip);

    // Pipe multiple lines back and process them
    auto lines = executeShell("printf 'a\\nb\\nc\\n'").output.splitLines;
    writeln(lines.length, " lines: ", lines);
}
