#include <cctype>
#include <iostream>
#include <optional>
#include <string>
#include <string_view>
#include <unordered_set>
#include <vector>

enum class Kind { Number, Ident, Keyword, String, Op };

struct Token {
    Kind kind;
    std::string_view text;
    int line, col;
};

class Lexer {
public:
    explicit Lexer(std::string_view src) : src_(src) {}

    std::optional<Token> next() {
        skip_trivia();
        if (pos_ >= src_.size()) return std::nullopt;
        std::size_t start = pos_;
        int col = static_cast<int>(pos_ - line_start_) + 1;
        char c = src_[pos_];
        Kind kind;
        if (std::isdigit(static_cast<unsigned char>(c))) {
            while (pos_ < src_.size() && (std::isdigit(static_cast<unsigned char>(src_[pos_])) || src_[pos_] == '.')) ++pos_;
            kind = Kind::Number;
        } else if (std::isalpha(static_cast<unsigned char>(c)) || c == '_') {
            while (pos_ < src_.size() && (std::isalnum(static_cast<unsigned char>(src_[pos_])) || src_[pos_] == '_')) ++pos_;
            kind = keywords().count(src_.substr(start, pos_ - start)) ? Kind::Keyword : Kind::Ident;
        } else if (c == '"') {
            for (++pos_; pos_ < src_.size() && src_[pos_] != '"'; ++pos_)
                if (src_[pos_] == '\\') ++pos_;
            ++pos_;
            kind = Kind::String;
        } else {
            static const std::string_view two[] = {"==", "!=", "<=", ">=", "&&", "||", "->"};
            pos_ += 1;
            for (auto op : two)
                if (src_.substr(start, 2) == op) pos_ = start + 2;
            kind = Kind::Op;
        }
        return Token{kind, src_.substr(start, pos_ - start), line_, col};
    }

private:
    static const std::unordered_set<std::string_view>& keywords() {
        static const std::unordered_set<std::string_view> kw{"auto", "if", "else", "while", "return", "for"};
        return kw;
    }

    void skip_trivia() {
        while (pos_ < src_.size()) {
            if (src_[pos_] == '\n') {
                ++line_;
                line_start_ = ++pos_;
            } else if (std::isspace(static_cast<unsigned char>(src_[pos_]))) {
                ++pos_;
            } else if (src_.substr(pos_, 2) == "//") {
                while (pos_ < src_.size() && src_[pos_] != '\n') ++pos_;
            } else {
                break;
            }
        }
    }

    std::string_view src_;
    std::size_t pos_ = 0, line_start_ = 0;
    int line_ = 1;
};

int main() {
    const char* names[] = {"NUMBER", "IDENT", "KEYWORD", "STRING", "OP"};
    Lexer lx("auto x = 3.5 * (y + 2); // note\nif (x >= 10 && ok) { puts(\"big\"); }");
    while (auto t = lx.next()) std::cout << t->line << ':' << t->col << '\t' << names[static_cast<int>(t->kind)] << '\t' << t->text << '\n';
}
