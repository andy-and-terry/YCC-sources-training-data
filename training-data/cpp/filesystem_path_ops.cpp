#include <filesystem>
#include <iostream>

namespace fs = std::filesystem;

int main() {
    fs::path p = "/usr/local/lib/libx.so.1";
    std::cout << p.filename() << p.stem() << p.extension() << p.parent_path() << "\n";
    p.replace_extension(".a");
    std::cout << p << " " << (fs::path("a") / "b" / "c.txt") << "\n";
    auto tmp = fs::temp_directory_path() / "cpp_demo_dir";
    fs::create_directories(tmp / "sub");
    std::cout << fs::exists(tmp / "sub");
    fs::remove_all(tmp);
    std::cout << fs::exists(tmp) << "\n";
}
