#include <cstdio>
#include <memory>

int main() {
    std::unique_ptr<FILE, decltype(&fclose)> f(std::fopen("/dev/null", "w"), &fclose);
    if (f) std::fputs("data", f.get());
    std::puts("done");
}
