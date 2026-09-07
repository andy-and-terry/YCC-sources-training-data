#include <iostream>
#include <memory>

class ModernPrinter {
public:
    virtual void printText(const std::string& text) = 0;
    virtual ~ModernPrinter() = default;
};

class LegacyPrinter {
public:
    void oldPrint(const char* text) { std::cout << "legacy: " << text << std::endl; }
};

class PrinterAdapter : public ModernPrinter {
public:
    explicit PrinterAdapter(std::unique_ptr<LegacyPrinter> legacy) : legacy(std::move(legacy)) {}
    void printText(const std::string& text) override { legacy->oldPrint(text.c_str()); }

private:
    std::unique_ptr<LegacyPrinter> legacy;
};

int main() {
    std::unique_ptr<ModernPrinter> printer = std::make_unique<PrinterAdapter>(std::make_unique<LegacyPrinter>());
    printer->printText("hello adapter");
    return 0;
}
