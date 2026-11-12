import java.util.ArrayList;
import java.util.List;
import java.util.function.Supplier;

public class LambdaCapturingEffectivelyFinal {
    public static void main(String[] args) {
        List<Supplier<Integer>> fs = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            final int k = i * i;
            fs.add(() -> k);
        }
        fs.forEach(f -> System.out.println(f.get()));
    }
}
