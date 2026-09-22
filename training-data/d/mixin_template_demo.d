import std.stdio;

mixin template Logger() {
    void log(string message) {
        writeln("[LOG] ", message);
    }
}

struct Service {
    mixin Logger;
    string name;

    void run() {
        log("starting " ~ name);
    }
}

class Worker {
    mixin Logger;
    void process() {
        log("processing job");
    }
}

void main() {
    auto service = Service("payments");
    service.run();

    auto worker = new Worker();
    worker.process();
}
