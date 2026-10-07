#include <functional>
#include <iostream>
#include <queue>
#include <string>
#include <vector>

class Simulator {
public:
    using Action = std::function<void()>;

    double now() const { return now_; }
    void at(double delay, Action a) { q_.push({now_ + delay, seq_++, std::move(a)}); }
    void run() {
        while (!q_.empty()) {
            auto ev = q_.top();
            q_.pop();
            now_ = ev.time;
            ev.action();
        }
    }

private:
    struct Event {
        double time;
        long seq;
        Action action;
        bool operator>(const Event& o) const { return time != o.time ? time > o.time : seq > o.seq; }
    };
    std::priority_queue<Event, std::vector<Event>, std::greater<>> q_;
    double now_ = 0;
    long seq_ = 0;
};

int main() {
    Simulator sim;
    double server_free = 0;
    struct C { double arrive, service; };
    std::vector<C> customers{{0, 3}, {1, 2}, {1.5, 4}, {6, 1}};
    for (std::size_t i = 0; i < customers.size(); ++i) {
        sim.at(customers[i].arrive, [&, i] {
            double start = std::max(sim.now(), server_free);
            server_free = start + customers[i].service;
            std::cout << "t=" << sim.now() << " c" << i << " arrives, waits " << start - sim.now() << '\n';
            sim.at(server_free - sim.now(), [&, i] { std::cout << "t=" << sim.now() << " c" << i << " leaves\n"; });
        });
    }
    sim.run();
}
