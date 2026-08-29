public class PropertyDemo {
    private Integer celsius;

    public Integer Celsius {
        get { return celsius; }
        set { celsius = value; }
    }

    public Double Fahrenheit {
        get { return celsius * 9.0 / 5.0 + 32; }
    }

    public static void main() {
        PropertyDemo temp = new PropertyDemo();
        temp.Celsius = 25;
        System.debug(temp.Fahrenheit);
    }
}
