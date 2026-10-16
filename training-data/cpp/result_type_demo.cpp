#include <iostream>
#include <string>
#include <variant>

template <typename T>
class Result {
    std::variant<T, std::string> data_;
public:
    static Result ok(T v) { Result r; r.data_.template emplace<0>(std::move(v)); return r; }
    static Result err(std::string m) { Result r; r.data_.template emplace<1>(std::move(m)); return r; }
    bool is_ok() const { return data_.index() == 0; }
    const T& value() const { return std::get<0>(data_); }
    const std::string& error() const { return std::get<1>(data_); }
private:
    Result() : data_(T{}) {}
};

Result<int> parse_positive(const std::string& s) {
    try {
        int n = std::stoi(s);
        if (n <= 0) return Result<int>::err("not positive: " + s);
        return Result<int>::ok(n);
    } catch (...) { return Result<int>::err("not a number: " + s); }
}

int main() {
    for (std::string s : {"42", "-3", "abc"}) {
        auto r = parse_positive(s);
        if (r.is_ok()) std::cout << "ok " << r.value() << "\n";
        else std::cout << "error " << r.error() << "\n";
    }
}
