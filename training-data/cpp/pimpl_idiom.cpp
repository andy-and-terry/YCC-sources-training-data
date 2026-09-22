#include <iostream>
#include <memory>
#include <string>
#include <vector>

// The Pimpl (pointer-to-implementation) idiom hides a class's private
// state and dependencies behind an opaque pointer, so changes to the
// implementation don't force recompilation of client code and the
// public header stays free of internal includes.
class Widget {
public:
    Widget();
    ~Widget();
    Widget(Widget&&) noexcept;
    Widget& operator=(Widget&&) noexcept;
    Widget(const Widget&) = delete;
    Widget& operator=(const Widget&) = delete;

    void addTag(const std::string& tag);
    void describe() const;

private:
    class Impl;
    std::unique_ptr<Impl> impl_;
};

class Widget::Impl {
public:
    std::vector<std::string> tags;
    int internalCounter = 0;

    void addTag(const std::string& tag) {
        tags.push_back(tag);
        internalCounter++;
    }

    void describe() const {
        std::cout << "widget with " << tags.size() << " tag(s), counter="
                  << internalCounter << ": ";
        for (const auto& t : tags) std::cout << t << " ";
        std::cout << std::endl;
    }
};

Widget::Widget() : impl_(std::make_unique<Impl>()) {}
Widget::~Widget() = default;
Widget::Widget(Widget&&) noexcept = default;
Widget& Widget::operator=(Widget&&) noexcept = default;

void Widget::addTag(const std::string& tag) { impl_->addTag(tag); }
void Widget::describe() const { impl_->describe(); }

int main() {
    Widget w;
    w.addTag("alpha");
    w.addTag("beta");
    w.describe();

    Widget w2 = std::move(w);
    w2.addTag("gamma");
    w2.describe();

    return 0;
}
