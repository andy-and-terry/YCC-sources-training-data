#include <iostream>
#include <memory>
#include <string>

class Handler {
public:
    virtual ~Handler() = default;
    void setNext(std::shared_ptr<Handler> next) { nextHandler = next; }
    virtual void handle(int severity, const std::string& message) {
        if (nextHandler) nextHandler->handle(severity, message);
    }

protected:
    std::shared_ptr<Handler> nextHandler;
};

class InfoHandler : public Handler {
public:
    void handle(int severity, const std::string& message) override {
        if (severity <= 1) {
            std::cout << "[INFO] " << message << std::endl;
        } else {
            Handler::handle(severity, message);
        }
    }
};

class WarningHandler : public Handler {
public:
    void handle(int severity, const std::string& message) override {
        if (severity == 2) {
            std::cout << "[WARNING] " << message << std::endl;
        } else {
            Handler::handle(severity, message);
        }
    }
};

class ErrorHandler : public Handler {
public:
    void handle(int severity, const std::string& message) override {
        if (severity >= 3) {
            std::cout << "[ERROR] " << message << std::endl;
        } else {
            Handler::handle(severity, message);
        }
    }
};

int main() {
    auto info = std::make_shared<InfoHandler>();
    auto warning = std::make_shared<WarningHandler>();
    auto error = std::make_shared<ErrorHandler>();
    info->setNext(warning);
    warning->setNext(error);

    info->handle(1, "system started");
    info->handle(2, "disk space low");
    info->handle(3, "out of memory");

    return 0;
}
