#include <iostream>

class DataProcessor {
public:
    void run() {
        readData();
        process();
        writeData();
    }
    virtual ~DataProcessor() = default;

protected:
    virtual void readData() { std::cout << "reading raw data" << std::endl; }
    virtual void process() = 0;
    virtual void writeData() { std::cout << "writing result" << std::endl; }
};

class CsvProcessor : public DataProcessor {
protected:
    void process() override { std::cout << "processing as CSV" << std::endl; }
};

class JsonProcessor : public DataProcessor {
protected:
    void readData() override { std::cout << "reading JSON payload" << std::endl; }
    void process() override { std::cout << "processing as JSON" << std::endl; }
};

int main() {
    CsvProcessor csv;
    csv.run();
    JsonProcessor json;
    json.run();
    return 0;
}
