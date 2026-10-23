public class IdGenerator : Object {
    private static int counter;
    private static string prefix;

    // runs once, before the class is first used
    static construct {
        counter = 100;
        prefix = "ID";
        print ("class initialised\n");
    }

    public static string next () {
        counter++;
        return "%s-%d".printf (prefix, counter);
    }
}

void main () {
    print ("start\n");
    print ("%s\n", IdGenerator.next ());
    print ("%s\n", IdGenerator.next ());
}
