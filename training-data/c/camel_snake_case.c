#include <ctype.h>
#include <stdio.h>

/* camelCase / PascalCase -> snake_case, treating acronym runs as one word. */
void camel_to_snake(const char *in, char *out) {
    size_t w = 0;
    for (size_t i = 0; in[i]; i++) {
        unsigned char c = (unsigned char)in[i];
        if (isupper(c) && i > 0) {
            int prev_lower = islower((unsigned char)in[i - 1]) || isdigit((unsigned char)in[i - 1]);
            int next_lower = in[i + 1] && islower((unsigned char)in[i + 1]);
            if (prev_lower || (isupper((unsigned char)in[i - 1]) && next_lower)) out[w++] = '_';
        }
        out[w++] = (char)tolower(c);
    }
    out[w] = '\0';
}

void snake_to_camel(const char *in, char *out, int pascal) {
    size_t w = 0;
    int up = pascal;
    for (; *in; in++) {
        if (*in == '_' || *in == '-') {
            up = 1;
            continue;
        }
        out[w++] = (char)(up ? toupper((unsigned char)*in) : tolower((unsigned char)*in));
        up = 0;
    }
    out[w] = '\0';
}

int main(void) {
    const char *camel[] = {"parseHTTPResponse", "XMLHttpRequest", "userId2Name"};
    const char *snake[] = {"parse_http_response", "background-color", "user_id"};
    char buf[128];
    for (int i = 0; i < 3; i++) {
        camel_to_snake(camel[i], buf);
        printf("%-20s -> %s\n", camel[i], buf);
    }
    for (int i = 0; i < 3; i++) {
        snake_to_camel(snake[i], buf, i == 2);
        printf("%-20s -> %s\n", snake[i], buf);
    }
    return 0;
}
