#include <algorithm>
#include <iostream>
#include <iterator>
#include <vector>

int main() {
    std::vector<int> v{1, 1, 2, 2, 2, 3, 1, 1};
    std::vector<int> out;
    std::unique_copy(v.begin(), v.end(), std::back_inserter(out));
    std::copy(out.begin(), out.end(), std::ostream_iterator<int>(std::cout, " "));
    std::cout << "\n";

    std::sort(v.begin(), v.end());
    v.erase(std::unique(v.begin(), v.end()), v.end());
    std::copy(v.begin(), v.end(), std::ostream_iterator<int>(std::cout, " "));
    std::cout << "\n";

    std::vector<int> r;
    std::reverse_copy(v.begin(), v.end(), std::back_inserter(r));
    std::copy(r.begin(), r.end(), std::ostream_iterator<int>(std::cout, ","));
    std::cout << "\n";
}
