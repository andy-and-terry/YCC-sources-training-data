#include <coroutine>
#include <iostream>

struct Gen {
    struct promise_type {
        int cur;
        Gen get_return_object() { return Gen{std::coroutine_handle<promise_type>::from_promise(*this)}; }
        std::suspend_always initial_suspend() { return {}; }
        std::suspend_always final_suspend() noexcept { return {}; }
        std::suspend_always yield_value(int v) { cur = v; return {}; }
        void return_void() {}
        void unhandled_exception() {}
    };
    std::coroutine_handle<promise_type> h;
    ~Gen() { if (h) h.destroy(); }
    bool next() { h.resume(); return !h.done(); }
    int value() { return h.promise().cur; }
};

Gen count(int n) { for (int i = 0; i < n; i++) co_yield i * i; }

int main() { auto g = count(5); while (g.next()) std::cout << g.value() << " "; std::cout << "\n"; }
