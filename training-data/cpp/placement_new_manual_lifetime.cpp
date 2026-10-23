#include <iostream>
#include <memory>
#include <new>
#include <string>

struct Noisy {
    std::string name;
    explicit Noisy(std::string n) : name(std::move(n)) { std::cout << "construct " << name << '\n'; }
    ~Noisy() { std::cout << "destroy " << name << '\n'; }
};

// A tiny fixed-capacity buffer that constructs objects in raw aligned storage.
template <typename T, std::size_t N>
class FixedPool {
    alignas(T) unsigned char storage_[sizeof(T) * N];
    std::size_t size_ = 0;
public:
    template <typename... Args>
    T* emplace(Args&&... args) {
        if (size_ == N) return nullptr;
        void* slot = storage_ + sizeof(T) * size_;
        T* obj = new (slot) T(std::forward<Args>(args)...);   // placement new
        ++size_;
        return obj;
    }
    T& operator[](std::size_t i) {
        return *std::launder(reinterpret_cast<T*>(storage_ + sizeof(T) * i));
    }
    std::size_t size() const { return size_; }
    ~FixedPool() {
        while (size_ > 0) (*this)[--size_].~T();              // explicit destructor call
    }
};

int main() {
    FixedPool<Noisy, 2> pool;
    pool.emplace("first");
    pool.emplace("second");
    if (!pool.emplace("third")) std::cout << "pool full\n";

    std::cout << "size=" << pool.size() << ", [1]=" << pool[1].name << '\n';
    std::cout << "leaving main\n";
}
