#include <cctype>
#include <cmath>
#include <iostream>
#include <map>
#include <sstream>
#include <stack>
#include <string>
#include <vector>

struct OpInfo {
    int prec;
    bool right_assoc;
};

const std::map<std::string, OpInfo> OPS{{"+", {1, false}}, {"-", {1, false}}, {"*", {2, false}}, {"/", {2, false}}, {"^", {3, true}}};

std::vector<std::string> to_rpn(const std::string& infix) {
    std::vector<std::string> out;
    std::stack<std::string> ops;
    std::istringstream in(infix);
    for (std::string t; in >> t;) {
        if (auto it = OPS.find(t); it != OPS.end()) {
            while (!ops.empty() && OPS.count(ops.top())) {
                const auto& top = OPS.at(ops.top());
                if (top.prec > it->second.prec || (top.prec == it->second.prec && !it->second.right_assoc)) {
                    out.push_back(ops.top());
                    ops.pop();
                } else break;
            }
            ops.push(t);
        } else if (t == "(") {
            ops.push(t);
        } else if (t == ")") {
            while (ops.top() != "(") out.push_back(ops.top()), ops.pop();
            ops.pop();
        } else {
            out.push_back(t);
        }
    }
    while (!ops.empty()) out.push_back(ops.top()), ops.pop();
    return out;
}

double eval_rpn(const std::vector<std::string>& rpn) {
    std::stack<double> st;
    for (const auto& t : rpn) {
        if (!OPS.count(t)) {
            st.push(std::stod(t));
            continue;
        }
        double b = st.top(); st.pop();
        double a = st.top(); st.pop();
        st.push(t == "+" ? a + b : t == "-" ? a - b : t == "*" ? a * b : t == "/" ? a / b : std::pow(a, b));
    }
    return st.top();
}

int main() {
    auto rpn = to_rpn("3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3");
    for (const auto& t : rpn) std::cout << t << ' ';
    std::cout << "= " << eval_rpn(rpn) << '\n';
}
