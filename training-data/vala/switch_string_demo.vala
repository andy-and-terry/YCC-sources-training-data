string describe_command (string cmd) {
    switch (cmd) {
        case "start":
        case "run":
            return "starting up";
        case "stop":
            return "shutting down";
        case "status":
            return "all good";
        default:
            return "unknown command '%s'".printf (cmd);
    }
}

void main () {
    string[] cmds = { "start", "run", "stop", "status", "reboot" };
    foreach (var c in cmds) {
        stdout.printf ("%-7s -> %s\n", c, describe_command (c));
    }

    int code = 404;
    switch (code) {
        case 200: stdout.printf ("OK\n"); break;
        case 404: stdout.printf ("Not Found\n"); break;
        default: stdout.printf ("Other\n"); break;
    }
}
