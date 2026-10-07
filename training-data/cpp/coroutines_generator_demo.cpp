#include <coroutine>
#include <iostream>

template <typename T>
struct Generator {
    struct promise_type {
        T current_value;

        Generator get_return_object() {
            return Generator{std::coroutine_handle<promise_type>::from_promise(*this)};
        }
        std::suspend_always initial_suspend() { return {}; }
        std::suspend_always final_suspend() noexcept { return {}; }
        std::suspend_always yield_value(T value) {
            current_value = value;
            return {};
        }
        void return_void() {}
        void unhandled_exception() { std::terminate(); }
    };

    std::coroutine_handle<promise_type> handle;

    explicit Generator(std::coroutine_handle<promise_type> h) : handle(h) {}
    ~Generator() {
        if (handle) handle.destroy();
    }
    Generator(const Generator&) = delete;
    Generator& operator=(const Generator&) = delete;

    bool next() {
        handle.resume();
        return !handle.done();
    }
    T value() const { return handle.promise().current_value; }
};

Generator<long> fibonacci(int count) {
    long a = 0, b = 1;
    for (int i = 0; i < count; i++) {
        co_yield a;
        long next = a + b;
        a = b;
        b = next;
    }
}

int main() {
    auto gen = fibonacci(10);
    while (gen.next()) {
        std::cout << gen.value() << " ";
    }
    std::cout << std::endl;
    return 0;
}
