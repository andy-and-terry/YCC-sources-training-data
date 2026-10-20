import java.util.Optional;

public class OptionalChaining {
    record Address(String city) {}
    record User(Address address) {}

    static String cityOf(Optional<User> user) {
        return user.map(User::address).map(Address::city).map(String::toUpperCase).orElse("UNKNOWN");
    }

    public static void main(String[] args) {
        System.out.println(cityOf(Optional.of(new User(new Address("paris")))));
        System.out.println(cityOf(Optional.empty()));
    }
}
