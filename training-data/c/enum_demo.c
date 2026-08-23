#include <stdio.h>

typedef enum { HEARTS, SPADES, CLUBS, DIAMONDS } Suit;

const char *color(Suit s) {
    switch (s) {
        case HEARTS:
        case DIAMONDS:
            return "red";
        case SPADES:
        case CLUBS:
            return "black";
    }
    return "unknown";
}

int main(void) {
    Suit suits[] = {HEARTS, SPADES, CLUBS, DIAMONDS};
    for (int i = 0; i < 4; i++) {
        printf("%d: %s\n", suits[i], color(suits[i]));
    }
    return 0;
}
