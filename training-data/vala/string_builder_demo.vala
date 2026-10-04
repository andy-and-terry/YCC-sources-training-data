string join_numbers (int[] nums) {
    var sb = new StringBuilder ();
    for (int i = 0; i < nums.length; i++) {
        if (i > 0) {
            sb.append (", ");
        }
        sb.append_printf ("%d", nums[i]);
    }
    return sb.str;
}

void main () {
    int[] nums = { 3, 1, 4, 1, 5 };
    stdout.printf ("[%s]\n", join_numbers (nums));

    var sb = new StringBuilder ("world");
    sb.prepend ("hello ");
    sb.append_c ('!');
    stdout.printf ("%s (len %d)\n", sb.str, (int) sb.len);

    sb.insert (5, ",");
    stdout.printf ("%s\n", sb.str);
    sb.truncate (5);
    stdout.printf ("%s\n", sb.str);
}
