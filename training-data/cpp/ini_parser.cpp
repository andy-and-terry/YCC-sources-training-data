#include <iostream>
#include <map>
#include <sstream>
#include <string>

std::string trim(const std::string& s) {
    size_t start = s.find_first_not_of(" \t");
    size_t end = s.find_last_not_of(" \t");
    return start == std::string::npos ? "" : s.substr(start, end - start + 1);
}

std::map<std::string, std::map<std::string, std::string>> parseIni(const std::string& text) {
    std::map<std::string, std::map<std::string, std::string>> result;
    std::istringstream stream(text);
    std::string rawLine, section;
    while (std::getline(stream, rawLine)) {
        std::string line = trim(rawLine);
        if (line.empty() || line[0] == '#' || line[0] == ';') continue;
        if (line.front() == '[' && line.back() == ']') {
            section = line.substr(1, line.size() - 2);
        } else {
            auto pos = line.find('=');
            if (pos != std::string::npos && !section.empty()) {
                result[section][trim(line.substr(0, pos))] = trim(line.substr(pos + 1));
            }
        }
    }
    return result;
}

int main() {
    std::string sample = "\n[server]\nhost = localhost\nport = 8080\n";
    for (auto& [section, kv] : parseIni(sample)) {
        std::cout << "[" << section << "]" << std::endl;
        for (auto& [k, v] : kv) std::cout << k << "=" << v << std::endl;
    }
    return 0;
}
