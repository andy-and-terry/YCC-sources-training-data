#include <iostream>
#include <stack>
#include <vector>

// Monotonic stack approach.
int trap(const std::vector<int>& h) {
    std::stack<std::size_t> st;
    int water = 0;
    for (std::size_t i = 0; i < h.size(); ++i) {
        while (!st.empty() && h[i] > h[st.top()]) {
            std::size_t bottom = st.top();
            st.pop();
            if (st.empty()) break;
            std::size_t left = st.top();
            int bounded = std::min(h[i], h[left]) - h[bottom];
            water += bounded * static_cast<int>(i - left - 1);
        }
        st.push(i);
    }
    return water;
}

int main() { std::cout << trap({0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1}) << ' ' << trap({4, 2, 0, 3, 2, 5}) << '\n'; }
