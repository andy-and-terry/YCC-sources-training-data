#include <filesystem>
#include <fstream>
#include <iostream>
#include <string>

namespace fs = std::filesystem;

int main() {
    fs::path p = "/usr/local/lib/libexample.so.1";
    std::cout << "filename:  " << p.filename() << std::endl;
    std::cout << "stem:      " << p.stem() << std::endl;
    std::cout << "extension: " << p.extension() << std::endl;
    std::cout << "parent:    " << p.parent_path() << std::endl;
    std::cout << "absolute:  " << p.is_absolute() << std::endl;

    fs::path joined = fs::path("data") / "reports" / "q1.csv";
    std::cout << "joined:    " << joined << std::endl;
    std::cout << "replaced:  " << joined.replace_extension(".txt") << std::endl;
    std::cout << "normal:    " << fs::path("a/./b/../c").lexically_normal() << std::endl;
    std::cout << "relative:  " << fs::path("/a/b/c").lexically_relative("/a") << std::endl;

    // work in a temporary directory
    fs::path root = fs::temp_directory_path() / "fs_demo_cpp";
    fs::create_directories(root / "sub");
    std::ofstream(root / "a.txt") << "hello";
    std::ofstream(root / "sub" / "b.txt") << "world!!";

    std::uintmax_t total = 0;
    for (const auto& entry : fs::recursive_directory_iterator(root)) {
        if (entry.is_regular_file()) total += entry.file_size();
    }
    std::cout << "total bytes: " << total << std::endl;
    std::cout << "exists: " << fs::exists(root / "a.txt") << std::endl;

    std::error_code ec;
    fs::remove_all(root, ec);
    std::cout << "removed: " << !fs::exists(root) << std::endl;
    return 0;
}
