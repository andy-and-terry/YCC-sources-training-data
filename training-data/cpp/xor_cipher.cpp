#include <iostream>
#include <string>

std::string xorTransform(const std::string& data, const std::string& key) {
    std::string result(data.size(), '\0');
    for (size_t i = 0; i < data.size(); i++) {
        result[i] = data[i] ^ key[i % key.size()];
    }
    return result;
}

int main() {
    std::string key = "secret";
    std::string ciphertext = xorTransform("hello world", key);
    std::cout << xorTransform(ciphertext, key) << std::endl;
    return 0;
}
