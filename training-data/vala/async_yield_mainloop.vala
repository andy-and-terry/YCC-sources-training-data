async int slow_square (int n) {
    Timeout.add (10, slow_square.callback);
    yield;
    return n * n;
}

async void run (MainLoop loop) {
    int a = yield slow_square (3);
    int b = yield slow_square (4);
    print ("%d %d\n", a, b);
    loop.quit ();
}

void main () {
    var loop = new MainLoop ();
    run.begin (loop);
    loop.run ();
    print ("done\n");
}
