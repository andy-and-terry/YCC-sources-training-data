import std.stdio;

int selectKth(int[] list, int left, int right, int targetIndex) {
    if (left == right) return list[left];

    int pivot = list[right];
    int storeIndex = left;
    foreach (i; left .. right) {
        if (list[i] < pivot) {
            auto tmp = list[storeIndex];
            list[storeIndex] = list[i];
            list[i] = tmp;
            storeIndex++;
        }
    }
    auto tmp = list[storeIndex];
    list[storeIndex] = list[right];
    list[right] = tmp;

    if (storeIndex == targetIndex) return list[storeIndex];
    if (storeIndex < targetIndex) return selectKth(list, storeIndex + 1, right, targetIndex);
    return selectKth(list, left, storeIndex - 1, targetIndex);
}

int quickselect(int[] nums, int k) {
    auto list = nums.dup;
    return selectKth(list, 0, cast(int) list.length - 1, cast(int) list.length - k);
}

void main() {
    writeln(quickselect([3, 2, 1, 5, 6, 4], 2));
    writeln(quickselect([3, 2, 3, 1, 2, 4, 5, 5, 6], 4));
}
