errordomain WorkError {
    FAILED
}

void step (int n) throws WorkError {
    stdout.printf ("step %d\n", n);
    if (n == 2) {
        throw new WorkError.FAILED ("step %d failed", n);
    }
}

void run () throws WorkError {
    try {
        step (1);
        step (2);
        step (3);
    } catch (WorkError e) {
        stdout.printf ("cleaning up after: %s\n", e.message);
        throw e;
    } finally {
        stdout.printf ("finally block\n");
    }
}

void main () {
    try {
        run ();
    } catch (WorkError e) {
        stdout.printf ("caught in main: %s\n", e.message);
    }
}
