#include <iostream>
#include <memory>
#include <string>
#include <vector>

// The PIMPL ("pointer to implementation") idiom hides a class's private
// data/implementation behind an opaque pointer, so changing the private
// details never forces callers to recompile against a new header.
class Widget {
public:
    Widget(std::string name, int priority);
    ~Widget();
    Widget(Widget&&) noexcept;
    Widget& operator=(Widget&&) noexcept;
    Widget(const Widget&) = delete;
    Widget& operator=(const Widget&) = delete;

    void addTag(const std::string& tag);
    void describe() const;

private:
    class Impl;
    std::unique_ptr<Impl> pImpl;
};

class Widget::Impl {
public:
    Impl(std::string n, int p) : name(std::move(n)), priority(p) {}

    std::string name;
    int priority;
    std::vector<std::string> tags;
};

Widget::Widget(std::string name, int priority)
    : pImpl(std::make_unique<Impl>(std::move(name), priority)) {}

Widget::~Widget() = default;
Widget::Widget(Widget&&) noexcept = default;
Widget& Widget::operator=(Widget&&) noexcept = default;

void Widget::addTag(const std::string& tag) { pImpl->tags.push_back(tag); }

void Widget::describe() const {
    std::cout << pImpl->name << " (priority " << pImpl->priority << ") tags: ";
    for (auto& tag : pImpl->tags) std::cout << tag << " ";
    std::cout << std::endl;
}

int main() {
    Widget w("task-queue", 3);
    w.addTag("backend");
    w.addTag("async");
    w.describe();

    Widget w2 = std::move(w);
    w2.describe();

    return 0;
}
