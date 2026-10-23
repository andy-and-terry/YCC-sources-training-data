#include <stdio.h>
#include <wchar.h>
#include <wctype.h>
#include <locale.h>

/* Wide strings use wchar_t and the w* family of functions. */
int main(void) {
    setlocale(LC_ALL, "");

    wchar_t word[] = L"naive cafe";
    size_t len = wcslen(word);
    printf("wide length: %zu\n", len);
    printf("bytes used:  %zu\n", sizeof word);

    /* uppercase each wide character */
    wchar_t upper[32];
    for (size_t i = 0; i <= len; i++)
        upper[i] = towupper(word[i]);
    printf("upper: %ls\n", upper);

    /* compare and search */
    printf("wcscmp(\"abc\", \"abd\") < 0: %d\n", wcscmp(L"abc", L"abd") < 0);
    const wchar_t *p = wcschr(word, L'c');
    printf("first 'c' at index %td\n", p - word);

    /* count letters and spaces */
    int letters = 0, spaces = 0;
    for (size_t i = 0; i < len; i++) {
        if (iswalpha(word[i])) letters++;
        else if (iswspace(word[i])) spaces++;
    }
    printf("letters=%d spaces=%d\n", letters, spaces);
    return 0;
}
