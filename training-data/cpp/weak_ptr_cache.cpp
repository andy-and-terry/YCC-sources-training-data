#include <iostream>
#include <map>
#include <memory>
#include <string>

struct Image {
    std::string name;
    explicit Image(std::string n) : name(std::move(n)) { std::cout << "load " << name << "\n"; }
    ~Image() { std::cout << "free " << name << "\n"; }
};

class ImageCache {
    std::map<std::string, std::weak_ptr<Image>> cache_;
public:
    std::shared_ptr<Image> get(const std::string& name) {
        if (auto sp = cache_[name].lock()) return sp;
        auto sp = std::make_shared<Image>(name);
        cache_[name] = sp;
        return sp;
    }
};

int main() {
    ImageCache cache;
    auto a = cache.get("sun.png");
    {
        auto b = cache.get("sun.png");
        std::cout << "shared use_count=" << a.use_count() << "\n";
    }
    a.reset();
    auto c = cache.get("sun.png");
}
