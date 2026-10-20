#include <iostream>
#include <stdexcept>

struct AppError : std::runtime_error { using std::runtime_error::runtime_error; };
struct NotFound : AppError { NotFound(const std::string& k) : AppError("not found: " + k) {} };

void find(const std::string& k) { if (k != "ok") throw NotFound(k); }
int safe() noexcept { return 1; }

int main() {
    try { find("zz"); }
    catch (const NotFound& e) { std::cout << "NF " << e.what() << "\n"; }
    catch (const std::exception& e) { std::cout << "other\n"; }
    std::cout << safe() << noexcept(safe()) << "\n";
}
