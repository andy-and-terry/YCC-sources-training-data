#include <iostream>
#include <memory>
#include <string>
#include <vector>

class FileSystemItem {
public:
    explicit FileSystemItem(std::string name) : name(std::move(name)) {}
    virtual ~FileSystemItem() = default;
    virtual int size() const = 0;
    virtual void print(int depth) const = 0;

protected:
    std::string name;
};

class File : public FileSystemItem {
public:
    File(std::string name, int file_size) : FileSystemItem(std::move(name)), file_size(file_size) {}

    int size() const override { return file_size; }

    void print(int depth) const override {
        std::cout << std::string(depth * 2, ' ') << name << " (" << file_size << ")" << std::endl;
    }

private:
    int file_size;
};

class Directory : public FileSystemItem {
public:
    explicit Directory(std::string name) : FileSystemItem(std::move(name)) {}

    void add(std::shared_ptr<FileSystemItem> item) { children.push_back(std::move(item)); }

    int size() const override {
        int total = 0;
        for (const auto &child : children) total += child->size();
        return total;
    }

    void print(int depth) const override {
        std::cout << std::string(depth * 2, ' ') << name << "/" << std::endl;
        for (const auto &child : children) child->print(depth + 1);
    }

private:
    std::vector<std::shared_ptr<FileSystemItem>> children;
};

int main() {
    auto root = std::make_shared<Directory>("root");
    auto src = std::make_shared<Directory>("src");

    src->add(std::make_shared<File>("main.cpp", 120));
    src->add(std::make_shared<File>("utils.cpp", 80));
    root->add(src);
    root->add(std::make_shared<File>("README.md", 20));

    root->print(0);
    std::cout << "total size: " << root->size() << std::endl;

    return 0;
}
