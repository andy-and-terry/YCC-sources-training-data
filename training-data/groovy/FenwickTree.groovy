class FenwickTree {
    int[] tree
    int n

    FenwickTree(int size) {
        n = size
        tree = new int[n + 1]
    }

    void update(int i, int delta) {
        while (i <= n) {
            tree[i] += delta
            i += i & (-i)
        }
    }

    int prefixSum(int i) {
        int sum = 0
        while (i > 0) {
            sum += tree[i]
            i -= i & (-i)
        }
        return sum
    }

    int rangeSum(int l, int r) {
        return prefixSum(r) - prefixSum(l - 1)
    }
}

def values = [3, 2, -1, 6, 5, 4, -3, 3, 7, 2]
def fenwick = new FenwickTree(values.size())
values.eachWithIndex { v, idx -> fenwick.update(idx + 1, v) }
println fenwick.rangeSum(1, 5)
fenwick.update(3, 4)
println fenwick.rangeSum(1, 5)
