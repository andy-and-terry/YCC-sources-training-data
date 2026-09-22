public class HeapSort {
    public static void sort(List<Integer> data) {
        Integer n = data.size();
        for (Integer i = n / 2 - 1; i >= 0; i--) {
            heapify(data, n, i);
        }
        for (Integer i = n - 1; i > 0; i--) {
            Integer temp = data[0];
            data[0] = data[i];
            data[i] = temp;
            heapify(data, i, 0);
        }
    }

    private static void heapify(List<Integer> data, Integer size, Integer root) {
        Integer largest = root;
        Integer left = 2 * root + 1;
        Integer right = 2 * root + 2;

        if (left < size && data[left] > data[largest]) {
            largest = left;
        }
        if (right < size && data[right] > data[largest]) {
            largest = right;
        }
        if (largest != root) {
            Integer temp = data[root];
            data[root] = data[largest];
            data[largest] = temp;
            heapify(data, size, largest);
        }
    }

    public static void main() {
        List<Integer> data = new List<Integer>{12, 11, 13, 5, 6, 7};
        sort(data);
        System.debug(data);
    }
}
