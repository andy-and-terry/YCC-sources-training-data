#include <iostream>
#include <map>
#include <optional>
#include <regex>
#include <string>

struct Url {
    std::string scheme, user, host, path, fragment;
    int port = -1;
    std::map<std::string, std::string> query;
};

std::optional<Url> parse_url(const std::string& s) {
    static const std::regex re(R"(^([a-zA-Z][a-zA-Z0-9+.-]*)://(?:([^@/]+)@)?([^:/?#]+)(?::(\d+))?(/[^?#]*)?(?:\?([^#]*))?(?:#(.*))?$)");
    std::smatch m;
    if (!std::regex_match(s, m, re)) return std::nullopt;
    Url u;
    u.scheme = m[1];
    u.user = m[2];
    u.host = m[3];
    u.port = m[4].matched ? std::stoi(m[4]) : u.scheme == "https" ? 443 : u.scheme == "http" ? 80 : -1;
    u.path = m[5].matched ? m[5].str() : "/";
    u.fragment = m[7];
    std::string q = m[6];
    for (std::size_t pos = 0; pos < q.size();) {
        auto amp = q.find('&', pos);
        auto pair = q.substr(pos, amp - pos);
        auto eq = pair.find('=');
        u.query[pair.substr(0, eq)] = eq == std::string::npos ? "" : pair.substr(eq + 1);
        pos = amp == std::string::npos ? q.size() : amp + 1;
    }
    return u;
}

int main() {
    for (auto s : {"https://user:pw@example.com:8443/a/b?x=1&y=2#top", "http://localhost", "not a url"}) {
        auto u = parse_url(s);
        if (!u) {
            std::cout << s << ": invalid\n";
            continue;
        }
        std::cout << u->scheme << " | " << u->host << " | " << u->port << " | " << u->path << " | #" << u->fragment << " |";
        for (const auto& [k, v] : u->query) std::cout << ' ' << k << '=' << v;
        std::cout << '\n';
    }
}
