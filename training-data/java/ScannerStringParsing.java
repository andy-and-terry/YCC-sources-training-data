import java.util.Scanner;

public class ScannerStringParsing {
    public static void main(String[] args) {
        // Token-based parsing of mixed values.
        try (Scanner in = new Scanner("42 3.5 hello true 7")) {
            int a = in.nextInt();
            double b = in.nextDouble();
            String word = in.next();
            boolean flag = in.nextBoolean();
            System.out.println(a + " " + b + " " + word + " " + flag);
            System.out.println("has int: " + in.hasNextInt());
            System.out.println("last: " + in.nextInt());
            System.out.println("has next: " + in.hasNext());
        }

        // Line-based parsing with a custom delimiter.
        String csv = "alice,30\nbob,25\ncarol,41";
        try (Scanner lines = new Scanner(csv)) {
            int total = 0;
            while (lines.hasNextLine()) {
                try (Scanner row = new Scanner(lines.nextLine()).useDelimiter(",")) {
                    String name = row.next();
                    int age = row.nextInt();
                    total += age;
                    System.out.println(name + " is " + age);
                }
            }
            System.out.println("total age: " + total);
        }

        // Skipping bad tokens safely.
        try (Scanner mixed = new Scanner("1 x 2 y 3")) {
            int sum = 0;
            while (mixed.hasNext()) {
                if (mixed.hasNextInt()) sum += mixed.nextInt();
                else mixed.next();
            }
            System.out.println("sum of ints: " + sum);
        }
    }
}
