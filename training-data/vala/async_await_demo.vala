async int fetch_value(int value, uint delay_ms) {
    SourceFunc callback = fetch_value.callback;
    Timeout.add(delay_ms, () => {
        callback();
        return false;
    });
    yield;
    return value;
}

MainLoop loop;

async void run() {
    int a = yield fetch_value(1, 30);
    int b = yield fetch_value(2, 10);
    stdout.printf("%d\n", a + b);
    loop.quit();
}

void main() {
    loop = new MainLoop();
    run.begin();
    loop.run();
}
