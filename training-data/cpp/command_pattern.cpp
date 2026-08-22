#include <iostream>
#include <memory>
#include <vector>

class Light {
public:
    bool on = false;
};

class Command {
public:
    virtual void execute() = 0;
    virtual void undo() = 0;
    virtual ~Command() = default;
};

class TurnOnCommand : public Command {
public:
    explicit TurnOnCommand(Light& light) : light(light) {}
    void execute() override { light.on = true; }
    void undo() override { light.on = false; }

private:
    Light& light;
};

class CommandHistory {
public:
    void execute(std::unique_ptr<Command> command) {
        command->execute();
        history.push_back(std::move(command));
    }

    void undoLast() {
        if (!history.empty()) {
            history.back()->undo();
            history.pop_back();
        }
    }

private:
    std::vector<std::unique_ptr<Command>> history;
};

int main() {
    Light light;
    CommandHistory history;
    history.execute(std::make_unique<TurnOnCommand>(light));
    std::cout << light.on << std::endl;
    history.undoLast();
    std::cout << light.on << std::endl;
    return 0;
}
