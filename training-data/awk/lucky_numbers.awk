#!/usr/bin/awk -f
BEGIN {
    len = 0
    for (v = 1; v <= 50; v += 2)
        nums[len++] = v
    for (i = 1; i < len && nums[i] <= len; i++) {
        step = nums[i]
        kept = 0
        for (idx = 0; idx < len; idx++)
            if ((idx + 1) % step != 0)
                tmp[kept++] = nums[idx]
        for (idx = 0; idx < kept; idx++)
            nums[idx] = tmp[idx]
        len = kept
    }
    out = nums[0]
    for (j = 1; j < len; j++)
        out = out " " nums[j]
    print out
}
