#include <iostream>

class CpuController {
public:
    void freeze() { std::cout << "cpu: freeze" << std::endl; }
    void jump(int position) { std::cout << "cpu: jump to " << position << std::endl; }
    void execute() { std::cout << "cpu: execute" << std::endl; }
};

class MemoryController {
public:
    void load(int position, const std::string& data) {
        std::cout << "memory: load '" << data << "' at " << position << std::endl;
    }
};

class HardDrive {
public:
    std::string read(int lba, int size) {
        std::cout << "disk: read " << size << " bytes at sector " << lba << std::endl;
        return "boot sector data";
    }
};

class ComputerFacade {
public:
    void start() {
        cpu_.freeze();
        std::string data = drive_.read(0, 512);
        memory_.load(0, data);
        cpu_.jump(0);
        cpu_.execute();
    }

private:
    CpuController cpu_;
    MemoryController memory_;
    HardDrive drive_;
};

int main() {
    ComputerFacade computer;
    computer.start();
    return 0;
}
