public class BinaryHeap {
    private List<Integer> data = new List<Integer>();

    public void push(Integer value) {
        data.add(value);
        Integer i = data.size() - 1;
        while (i > 0) {
            Integer parent = (i - 1) / 2;
            if (data[parent] <= data[i]) {
                break;
            }
            swap(parent, i);
            i = parent;
        }
    }

    public Integer pop() {
        Integer top = data[0];
        Integer last = data.remove(data.size() - 1);
        if (!data.isEmpty()) {
            data[0] = last;
            heapifyDown(0);
        }
        return top;
    }

    public Boolean isEmpty() {
        return data.isEmpty();
    }

    private void heapifyDown(Integer i) {
        Integer size = data.size();
        while (true) {
            Integer left = i * 2 + 1;
            Integer right = i * 2 + 2;
            Integer smallest = i;
            if (left < size && data[left] < data[smallest]) {
                smallest = left;
            }
            if (right < size && data[right] < data[smallest]) {
                smallest = right;
            }
            if (smallest == i) {
                break;
            }
            swap(i, smallest);
            i = smallest;
        }
    }

    private void swap(Integer i, Integer j) {
        Integer temp = data[i];
        data[i] = data[j];
        data[j] = temp;
    }

    public static void main() {
        BinaryHeap heap = new BinaryHeap();
        for (Integer value : new List<Integer>{5, 2, 9, 1, 7}) {
            heap.push(value);
        }
        while (!heap.isEmpty()) {
            System.debug(heap.pop());
        }
    }
}
