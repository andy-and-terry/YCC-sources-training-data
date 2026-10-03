#include <iostream>
#include <memory>
#include <string>
#include <vector>

// Classic GoF Iterator pattern: traversal logic lives behind an
// abstract Iterator interface, separate from the Aggregate that owns
// the data, so new traversal strategies (or new collection types) can
// be added without changing client code. (Distinct from
// custom_iterator_range_demo.cpp, which adapts a container to the
// STL's begin()/end() range-for idiom instead.)
template <typename T>
class Iterator {
public:
    virtual ~Iterator() = default;
    virtual bool hasNext() const = 0;
    virtual T next() = 0;
};

template <typename T>
class Aggregate {
public:
    virtual ~Aggregate() = default;
    virtual std::unique_ptr<Iterator<T>> createIterator() const = 0;
};

class NameCollection : public Aggregate<std::string> {
public:
    void add(const std::string& name) { names.push_back(name); }

    std::unique_ptr<Iterator<std::string>> createIterator() const override;

private:
    std::vector<std::string> names;
    friend class NameIterator;
};

class NameIterator : public Iterator<std::string> {
public:
    explicit NameIterator(const NameCollection& collection) : collection(collection), index(0) {}

    bool hasNext() const override { return index < collection.names.size(); }
    std::string next() override { return collection.names[index++]; }

private:
    const NameCollection& collection;
    size_t index;
};

std::unique_ptr<Iterator<std::string>> NameCollection::createIterator() const {
    return std::make_unique<NameIterator>(*this);
}

int main() {
    NameCollection names;
    names.add("Ada");
    names.add("Grace");
    names.add("Alan");

    auto it = names.createIterator();
    while (it->hasNext()) {
        std::cout << it->next() << std::endl;
    }
    return 0;
}
