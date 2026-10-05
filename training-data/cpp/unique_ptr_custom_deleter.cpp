#include <cstdio>
#include <iostream>
#include <memory>

struct FileCloser {
    void operator()(std::FILE *f) const {
        if (f) {
            std::cout << "closing file" << std::endl;
            std::fclose(f);
        }
    }
};

int main() {
    std::unique_ptr<std::FILE, FileCloser> file(std::fopen("/dev/null", "w"));
    if (file) {
        std::fputs("hello", file.get());
    }

    auto deleter = [](int *p) {
        std::cout << "freeing array of ints" << std::endl;
        delete[] p;
    };
    std::unique_ptr<int[], decltype(deleter)> data(new int[4]{1, 2, 3, 4}, deleter);
    std::cout << "data[2] = " << data[2] << std::endl;
    return 0;
}
