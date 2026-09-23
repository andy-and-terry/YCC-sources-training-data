abstract class DataProcessor {
    final List<Integer> process(List<Integer> data) {
        def loaded = load(data)
        def transformed = transform(loaded)
        output(transformed)
        return transformed
    }

    List<Integer> load(List<Integer> data) {
        return data
    }

    abstract List<Integer> transform(List<Integer> data)

    abstract void output(List<Integer> data)
}

class DoublingProcessor extends DataProcessor {
    List<Integer> transform(List<Integer> data) {
        return data.collect { it * 2 }
    }

    void output(List<Integer> data) {
        println "doubled: $data"
    }
}

class SumProcessor extends DataProcessor {
    List<Integer> transform(List<Integer> data) {
        return [data.sum()]
    }

    void output(List<Integer> data) {
        println "sum: ${data[0]}"
    }
}

def data = [1, 2, 3, 4, 5]
new DoublingProcessor().process(data)
new SumProcessor().process(data)
