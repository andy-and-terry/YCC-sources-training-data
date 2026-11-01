#include <cstdio>
#include <memory>

int main() {
    auto closer = [](std::FILE* f) { if (f) { std::fclose(f); std::puts("closed"); } };
    std::unique_ptr<std::FILE, decltype(closer)> f(std::fopen("/dev/null", "r"), closer);
    std::puts(f ? "opened" : "failed");
}
