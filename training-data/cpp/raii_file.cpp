#include <cstdio>
#include <stdexcept>
#include <string>

class FileHandle {
public:
    explicit FileHandle(const std::string& path, const char* mode) {
        file_ = std::fopen(path.c_str(), mode);
        if (!file_) {
            throw std::runtime_error("failed to open file: " + path);
        }
    }

    ~FileHandle() {
        if (file_) std::fclose(file_);
    }

    FileHandle(const FileHandle&) = delete;
    FileHandle& operator=(const FileHandle&) = delete;

    FileHandle(FileHandle&& other) noexcept : file_(other.file_) {
        other.file_ = nullptr;
    }

    FileHandle& operator=(FileHandle&& other) noexcept {
        if (this != &other) {
            if (file_) std::fclose(file_);
            file_ = other.file_;
            other.file_ = nullptr;
        }
        return *this;
    }

    void write(const std::string& data) {
        std::fwrite(data.data(), 1, data.size(), file_);
    }

    FILE* raw() const { return file_; }

private:
    FILE* file_ = nullptr;
};

int main() {
    try {
        FileHandle handle("/tmp/raii_example.txt", "w");
        handle.write("hello from RAII\n");
    } catch (const std::exception& e) {
        std::fprintf(stderr, "error: %s\n", e.what());
        return 1;
    }
    return 0;
}
