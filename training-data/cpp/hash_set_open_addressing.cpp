#include <functional>
#include <iostream>
#include <optional>
#include <string>
#include <vector>

template <typename K, typename Hash = std::hash<K>>
class OpenHashSet {
    enum class State { Empty, Full, Deleted };
    struct Slot {
        State state = State::Empty;
        std::optional<K> key;
    };

public:
    bool insert(const K& k) {
        if (contains(k)) return false;
        if ((used_ + 1) * 4 > slots_.size() * 3) rehash(slots_.empty() ? 8 : slots_.size() * 2);
        std::size_t i = index(k);
        while (slots_[i].state == State::Full) i = (i + 1) % slots_.size();
        if (slots_[i].state == State::Empty) ++used_;
        slots_[i] = {State::Full, k};
        ++size_;
        return true;
    }

    bool contains(const K& k) const { return find(k).has_value(); }

    bool erase(const K& k) {
        auto i = find(k);
        if (!i) return false;
        slots_[*i] = {State::Deleted, std::nullopt};
        --size_;
        return true;
    }

    std::size_t size() const { return size_; }

private:
    std::size_t index(const K& k) const { return Hash{}(k) % slots_.size(); }

    std::optional<std::size_t> find(const K& k) const {
        if (slots_.empty()) return std::nullopt;
        for (std::size_t i = index(k), n = 0; n < slots_.size(); i = (i + 1) % slots_.size(), ++n) {
            if (slots_[i].state == State::Empty) return std::nullopt;
            if (slots_[i].state == State::Full && *slots_[i].key == k) return i;
        }
        return std::nullopt;
    }

    void rehash(std::size_t cap) {
        auto old = std::move(slots_);
        slots_.assign(cap, Slot{});
        size_ = used_ = 0;
        for (auto& s : old)
            if (s.state == State::Full) insert(*s.key);
    }

    std::vector<Slot> slots_;
    std::size_t size_ = 0, used_ = 0;
};

int main() {
    OpenHashSet<std::string> s;
    for (auto w : {"the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"}) s.insert(w);
    s.erase("fox");
    std::cout << s.size() << ' ' << s.contains("fox") << ' ' << s.contains("dog") << '\n';
}
