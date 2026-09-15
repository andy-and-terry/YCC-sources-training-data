#include <iostream>

class DataProcessor {
public:
    void process() {
        loadData();
        transformData();
        saveData();
    }
    virtual ~DataProcessor() = default;

protected:
    virtual void loadData() { std::cout << "loading raw data" << std::endl; }
    virtual void transformData() = 0;
    virtual void saveData() { std::cout << "saving result" << std::endl; }
};

class CsvProcessor : public DataProcessor {
protected:
    void transformData() override { std::cout << "transforming CSV rows" << std::endl; }
};

class JsonProcessor : public DataProcessor {
protected:
    void loadData() override { std::cout << "loading JSON document" << std::endl; }
    void transformData() override { std::cout << "flattening JSON fields" << std::endl; }
};

int main() {
    CsvProcessor csv;
    csv.process();

    std::cout << "---" << std::endl;

    JsonProcessor json;
    json.process();
    return 0;
}
