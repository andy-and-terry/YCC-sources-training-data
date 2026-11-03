String swapCase(String s) => s.split('').map((c) {
      return c == c.toUpperCase() ? c.toLowerCase() : c.toUpperCase();
    }).join();

void main() => print(swapCase('Hello World 42'));
