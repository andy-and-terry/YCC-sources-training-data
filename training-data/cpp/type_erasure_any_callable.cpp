#include <iostream>
#include <memory>
#include <vector>

class Drawable {
    struct Concept { virtual ~Concept() = default; virtual void draw() const = 0; };
    template <typename T> struct Model : Concept { T t; Model(T t) : t(std::move(t)) {} void draw() const override { t.draw(); } };
    std::unique_ptr<Concept> p_;
public:
    template <typename T> Drawable(T t) : p_(std::make_unique<Model<T>>(std::move(t))) {}
    void draw() const { p_->draw(); }
};

struct Circle { void draw() const { std::cout << "circle\n"; } };
struct Text { void draw() const { std::cout << "text\n"; } };

int main() { std::vector<Drawable> v; v.emplace_back(Circle{}); v.emplace_back(Text{}); for (auto& d : v) d.draw(); }
