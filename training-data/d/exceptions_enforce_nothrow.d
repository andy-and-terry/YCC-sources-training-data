import std.stdio, std.exception, std.conv;

class ValidationError : Exception {
    int code;
    this(string msg, int code, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
        this.code = code;
    }
}

int parsePositive(string s) {
    int n = to!int(s);
    enforce!ValidationError(n >= 0, "negative number");
    return n;
}

int safe(string s) nothrow {
    try return parsePositive(s);
    catch (Exception) return -1;
}

void main() {
    foreach (s; ["42", "-1", "zz"]) {
        try writeln(parsePositive(s));
        catch (ValidationError e) writeln("validation: ", e.msg);
        catch (ConvException e) writeln("conversion failed");
        finally writeln("done ", s);
    }
    writeln(safe("7"), " ", safe("x"));
    auto e = collectException(parsePositive("-5"));
    writeln(e !is null ? e.msg : "none");
    writeln(assumeWontThrow(safe("3")));
    try { int[] a; auto x = a[3]; } catch (Throwable t) { writeln("range error: ", typeid(t).name); }
}
