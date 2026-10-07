#include <iomanip>
#include <iostream>
#include <map>
#include <stdexcept>
#include <string>
#include <vector>

struct Product {
    std::string name;
    long price_cents;
    int reorder_level;
    int qty = 0;
};

class Inventory {
public:
    void add(const std::string& sku, Product p) {
        if (!items_.emplace(sku, std::move(p)).second) throw std::invalid_argument("duplicate sku " + sku);
    }
    void receive(const std::string& sku, int qty) { get(sku).qty += qty; }
    long sell(const std::string& sku, int qty) {
        auto& p = get(sku);
        if (p.qty < qty) throw std::runtime_error("insufficient " + p.name);
        p.qty -= qty;
        return qty * p.price_cents;
    }
    std::vector<std::string> reorder_list() const {
        std::vector<std::string> out;
        for (const auto& [sku, p] : items_)
            if (p.qty <= p.reorder_level) out.push_back(p.name);
        return out;
    }

private:
    Product& get(const std::string& sku) {
        auto it = items_.find(sku);
        if (it == items_.end()) throw std::out_of_range("unknown sku " + sku);
        return it->second;
    }
    std::map<std::string, Product> items_;
};

int main() {
    Inventory inv;
    inv.add("A1", {"apple", 50, 10});
    inv.add("P1", {"pear", 75, 5});
    inv.receive("A1", 40);
    inv.receive("P1", 8);
    long revenue = inv.sell("A1", 32) + inv.sell("P1", 2);
    try {
        inv.sell("P1", 100);
    } catch (const std::exception& e) {
        std::cout << "error: " << e.what() << '\n';
    }
    std::cout << "revenue " << revenue / 100 << '.' << std::setw(2) << std::setfill('0') << revenue % 100 << "; reorder:";
    for (const auto& n : inv.reorder_list()) std::cout << ' ' << n;
    std::cout << '\n';
}
