#!/usr/bin/awk -f
BEGIN {
    limit = 100
    len = 0
    for (v = 1; v < limit; v += 2)
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
    for (n = 1; n < len; n++)
        out = out " " nums[n]
    print out
}
