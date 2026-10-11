#include <iostream>
#include <string>

class Rectangle {
    int w_, h_;
    std::string label_;
public:
    Rectangle(int w, int h, std::string label) : w_(w), h_(h), label_(std::move(label)) {
        std::cout << "main ctor " << label_ << "\n";
    }
    Rectangle(int side) : Rectangle(side, side, "square") {}
    Rectangle() : Rectangle(1) {}
    int area() const { return w_ * h_; }
    const std::string& label() const { return label_; }
};

int main() {
    Rectangle r1(3, 4, "rect"), r2(5), r3;
    std::cout << r1.label() << "=" << r1.area() << " " << r2.label() << "=" << r2.area() << " " << r3.area() << "\n";
}
