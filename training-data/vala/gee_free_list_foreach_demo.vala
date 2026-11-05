void main () {
    int[] arr = {5, 3, 8, 1};
    int sum = 0;
    foreach (int x in arr) sum += x;
    print ("sum=%d len=%d\n", sum, arr.length);
    int[] copy = arr[1:3];
    print ("%d %d\n", copy[0], copy[1]);
}
