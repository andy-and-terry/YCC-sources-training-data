#include <chrono>
#include <iostream>

int main() {
    using namespace std::chrono;
    auto d = 3725s;
    auto h = duration_cast<hours>(d);
    auto m = duration_cast<minutes>(d - h);
    auto s = duration_cast<seconds>(d - h - m);
    std::cout << h.count() << "h " << m.count() << "m " << s.count() << "s\n";

    milliseconds ms = 1500ms + 2s;
    std::cout << ms.count() << " ms\n";
    duration<double> frac = ms;
    std::cout << frac.count() << " s\n";
    std::cout << (90min > 1h) << "\n";
    std::cout << floor<minutes>(d).count() << " whole minutes\n";
}
