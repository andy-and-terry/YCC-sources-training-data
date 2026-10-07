#include <cmath>
#include <functional>
#include <iomanip>
#include <iostream>
#include <optional>

std::optional<double> newton(const std::function<double(double)>& f, const std::function<double(double)>& df,
                             double x0, double tol = 1e-12, int max_iter = 100) {
    double x = x0;
    for (int i = 0; i < max_iter; ++i) {
        double d = df(x);
        if (d == 0) return std::nullopt;
        double next = x - f(x) / d;
        if (std::abs(next - x) < tol) return next;
        x = next;
    }
    return std::nullopt;
}

int main() {
    std::cout << std::setprecision(15);
    for (double a : {2.0, 9.0, 0.25, 1e10}) {
        auto r = newton([a](double x) { return x * x - a; }, [](double x) { return 2 * x; }, std::max(a, 1.0));
        std::cout << "sqrt(" << a << ") = " << *r << '\n';
    }
    auto root = newton([](double x) { return std::cos(x) - x; }, [](double x) { return -std::sin(x) - 1; }, 1);
    std::cout << "cos(x) = x at " << root.value_or(NAN) << '\n';
    auto bad = newton([](double x) { return x * x + 1; }, [](double x) { return 2 * x; }, 0);
    std::cout << "x^2+1 from 0: " << (bad ? "converged" : "failed") << '\n';
}
