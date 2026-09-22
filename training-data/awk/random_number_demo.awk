#!/usr/bin/awk -f
# Demonstrates srand()/rand(): rand() returns a value in [0, 1), which is
# scaled into a bounded integer range to simulate dice rolls. srand()
# with no argument reseeds from the current time and returns the
# previous seed value.
BEGIN {
    previous_seed = srand()
    print "previous seed was:", previous_seed

    low = 1
    high = 6
    for (i = 1; i <= 5; i++) {
        roll = int(rand() * (high - low + 1)) + low
        print "roll", i ":", roll
    }
}
