import java.util.Arrays;
import java.util.function.UnaryOperator;

public class StrategyPattern {
    static class SortContext {
        private UnaryOperator<int[]> strategy;

        SortContext(UnaryOperator<int[]> strategy) {
            this.strategy = strategy;
        }

        void setStrategy(UnaryOperator<int[]> strategy) {
            this.strategy = strategy;
        }

        int[] sort(int[] items) {
            return strategy.apply(items);
        }
    }

    static int[] ascending(int[] items) {
        int[] copy = items.clone();
        Arrays.sort(copy);
        return copy;
    }

    static int[] descending(int[] items) {
        int[] copy = ascending(items);
        for (int i = 0; i < copy.length / 2; i++) {
            int tmp = copy[i];
            copy[i] = copy[copy.length - 1 - i];
            copy[copy.length - 1 - i] = tmp;
        }
        return copy;
    }

    public static void main(String[] args) {
        SortContext context = new SortContext(StrategyPattern::ascending);
        System.out.println(Arrays.toString(context.sort(new int[] {5, 3, 8, 1})));
        context.setStrategy(StrategyPattern::descending);
        System.out.println(Arrays.toString(context.sort(new int[] {5, 3, 8, 1})));
    }
}
