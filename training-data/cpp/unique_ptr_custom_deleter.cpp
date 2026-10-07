#include <cstdio>
#include <iostream>
#include <memory>

struct FileCloser {
    void operator()(std::FILE* f) const {
        if (f) { std::fclose(f); std::cout << "file closed\n"; }
    }
};

int main() {
    std::unique_ptr<std::FILE, FileCloser> f(std::tmpfile());
    if (!f) return 1;
    std::fputs("hello", f.get());

    auto arr = std::unique_ptr<int, void (*)(int*)>(
        new int(5), [](int* p) { std::cout << "deleting " << *p << "\n"; delete p; });
    std::cout << *arr << "\n";
}
