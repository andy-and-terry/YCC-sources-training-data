#include <iostream>
#include <stdexcept>
#include <string>

class ApiError : public std::runtime_error {
public:
    explicit ApiError(const std::string& msg) : std::runtime_error(msg) {}
};

class NotFoundError : public ApiError {
public:
    explicit NotFoundError(const std::string& resource) : ApiError(resource + " not found") {}
};

class ValidationError : public ApiError {
public:
    ValidationError(const std::string& field, const std::string& msg)
        : ApiError("invalid field '" + field + "': " + msg) {}
};

void fetchResource(int id) {
    if (id < 0) throw ValidationError("id", "must be non-negative");
    if (id > 100) throw NotFoundError("resource " + std::to_string(id));
}

int main() {
    try {
        fetchResource(999);
    } catch (const ApiError& e) {
        std::cout << "error: " << e.what() << std::endl;
    }

    try {
        fetchResource(-1);
    } catch (const ApiError& e) {
        std::cout << "error: " << e.what() << std::endl;
    }
    return 0;
}
