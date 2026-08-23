import std.stdio;

string httpStatusCategory(int code) {
    switch (code) {
        case 200: .. case 299:
            return "success";
        case 300: .. case 399:
            return "redirect";
        case 400: .. case 499:
            return "client error";
        case 500: .. case 599:
            return "server error";
        default:
            return "unknown";
    }
}

void main() {
    foreach (code; [200, 301, 404, 503, 999]) {
        writeln(code, ": ", httpStatusCategory(code));
    }
}
