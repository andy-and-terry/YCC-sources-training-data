class Robot : Object {
    public string name { get; construct; }
    public int battery { get; private set; }

    public Robot(string name) {
        Object(name: name);
    }

    construct {
        battery = 100;
        stdout.printf("%s booted with battery at %d\n", name, battery);
    }

    public void work(int cost) {
        battery -= cost;
        if (battery < 0) battery = 0;
    }
}

void main() {
    var robot = new Robot("R2");
    robot.work(35);
    stdout.printf("%s battery remaining: %d\n", robot.name, robot.battery);
}
