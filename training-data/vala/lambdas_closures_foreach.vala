delegate void Action ();

Action make_counter (out int[] cell) {
    cell = new int[1];
    int[] box = cell;
    return () => { box[0]++; };
}

void main () {
    int total = 0;
    int[] nums = {1, 2, 3, 4, 5};
    foreach (var n in nums) total += n;
    print ("%d\n", total);
    int[] cell;
    var inc = make_counter (out cell);
    inc (); inc ();
    print ("%d\n", cell[0]);
    var list = new GLib.List<int> ();
    foreach (var n in nums) list.append (n);
    list.foreach ((x) => print ("%d ", x));
    print ("\n");
    var sq = new int[nums.length];
    for (int i = 0; i < nums.length; i++) sq[i] = nums[i] * nums[i];
    print ("%d %d\n", sq[2], sq[nums.length - 1]);
    Func<int> printer = (x) => print ("<%d>", x);
    printer (9);
    print ("\n");
}
