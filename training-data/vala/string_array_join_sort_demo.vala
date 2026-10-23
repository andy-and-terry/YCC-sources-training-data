void main () {
    string[] words = { "pear", "apple", "fig", "banana" };

    for (int i = 1; i < words.length; i++) {
        string key = words[i];
        int j = i - 1;
        while (j >= 0 && strcmp (words[j], key) > 0) {
            words[j + 1] = words[j];
            j--;
        }
        words[j + 1] = key;
    }
    print ("%s\n", string.joinv (", ", words));

    string csv = "3,1,2";
    int[] nums = {};
    foreach (unowned string part in csv.split (",")) {
        nums += int.parse (part);
    }
    print ("parsed %d numbers, first = %d\n", nums.length, nums[0]);
}
