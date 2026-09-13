import java.util.List;

public class TemplateMethodPattern {
    abstract static class DataProcessor {
        final void process(List<Integer> data) {
            List<Integer> loaded = load(data);
            List<Integer> transformed = transform(loaded);
            output(transformed);
        }

        List<Integer> load(List<Integer> data) {
            return data;
        }

        abstract List<Integer> transform(List<Integer> data);

        abstract void output(List<Integer> data);
    }

    static class DoublingProcessor extends DataProcessor {
        List<Integer> transform(List<Integer> data) {
            return data.stream().map(n -> n * 2).toList();
        }

        void output(List<Integer> data) {
            System.out.println("doubled: " + data);
        }
    }

    static class SumProcessor extends DataProcessor {
        List<Integer> transform(List<Integer> data) {
            int sum = data.stream().mapToInt(Integer::intValue).sum();
            return List.of(sum);
        }

        void output(List<Integer> data) {
            System.out.println("sum: " + data.get(0));
        }
    }

    public static void main(String[] args) {
        List<Integer> data = List.of(1, 2, 3, 4, 5);
        new DoublingProcessor().process(data);
        new SumProcessor().process(data);
    }
}
