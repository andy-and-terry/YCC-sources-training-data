#include <iomanip>
#include <iostream>
#include <sstream>

int main() {
    std::istringstream in("3 4.5 word");
    int a; double b; std::string c;
    in >> a >> b >> c;
    std::ostringstream out;
    out << std::fixed << std::setprecision(2) << std::setw(8) << b << "|" << std::hex << std::showbase << a * 100 << "|" << c;
    std::cout << out.str() << "\n";
}
