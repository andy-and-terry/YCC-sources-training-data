#include <iostream>
#include <memory>

class Button {
public:
    virtual void render() const = 0;
    virtual ~Button() = default;
};

class Checkbox {
public:
    virtual void render() const = 0;
    virtual ~Checkbox() = default;
};

class DarkButton : public Button {
public:
    void render() const override { std::cout << "[dark button]" << std::endl; }
};

class DarkCheckbox : public Checkbox {
public:
    void render() const override { std::cout << "[dark checkbox]" << std::endl; }
};

class LightButton : public Button {
public:
    void render() const override { std::cout << "[light button]" << std::endl; }
};

class LightCheckbox : public Checkbox {
public:
    void render() const override { std::cout << "[light checkbox]" << std::endl; }
};

class UiFactory {
public:
    virtual std::unique_ptr<Button> createButton() const = 0;
    virtual std::unique_ptr<Checkbox> createCheckbox() const = 0;
    virtual ~UiFactory() = default;
};

class DarkThemeFactory : public UiFactory {
public:
    std::unique_ptr<Button> createButton() const override { return std::make_unique<DarkButton>(); }
    std::unique_ptr<Checkbox> createCheckbox() const override { return std::make_unique<DarkCheckbox>(); }
};

class LightThemeFactory : public UiFactory {
public:
    std::unique_ptr<Button> createButton() const override { return std::make_unique<LightButton>(); }
    std::unique_ptr<Checkbox> createCheckbox() const override { return std::make_unique<LightCheckbox>(); }
};

void renderUi(const UiFactory& factory) {
    auto button = factory.createButton();
    auto checkbox = factory.createCheckbox();
    button->render();
    checkbox->render();
}

int main() {
    DarkThemeFactory dark;
    LightThemeFactory light;

    renderUi(dark);
    renderUi(light);

    return 0;
}
