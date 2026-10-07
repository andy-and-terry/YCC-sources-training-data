void main() {
    var loop = new MainLoop();
    int ticks = 0;

    Timeout.add(50, () => {
        ticks++;
        stdout.printf("tick %d\n", ticks);
        if (ticks == 3) {
            loop.quit();
            return false;
        }
        return true;
    });

    Idle.add(() => {
        stdout.printf("idle callback runs once\n");
        return false;
    });

    loop.run();
    stdout.printf("loop finished after %d ticks\n", ticks);
}
