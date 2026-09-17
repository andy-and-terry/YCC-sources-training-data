#include <iostream>
#include <memory>
#include <string>

class Image {
public:
    virtual void display() = 0;
    virtual ~Image() = default;
};

class RealImage : public Image {
public:
    explicit RealImage(std::string filename) : filename_(std::move(filename)) {
        loadFromDisk();
    }

    void display() override { std::cout << "displaying " << filename_ << std::endl; }

private:
    void loadFromDisk() { std::cout << "loading " << filename_ << " from disk" << std::endl; }
    std::string filename_;
};

class ProxyImage : public Image {
public:
    explicit ProxyImage(std::string filename) : filename_(std::move(filename)) {}

    void display() override {
        if (!real_) {
            real_ = std::make_unique<RealImage>(filename_);
        }
        real_->display();
    }

private:
    std::string filename_;
    std::unique_ptr<RealImage> real_;
};

int main() {
    ProxyImage image("photo.jpg");
    std::cout << "proxy created, no disk access yet" << std::endl;
    image.display();
    std::cout << "second call, no reload" << std::endl;
    image.display();
    return 0;
}
