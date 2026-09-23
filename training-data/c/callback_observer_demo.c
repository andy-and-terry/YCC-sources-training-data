#include <stdio.h>

typedef void (*Observer)(const char *event);

static void log_observer(const char *event) {
    printf("[Log] %s\n", event);
}

static void alert_observer(const char *event) {
    printf("[Alert] %s\n", event);
}

#define MAX_OBSERVERS 8

typedef struct {
    Observer subscribers[MAX_OBSERVERS];
    int count;
} Subject;

static void subject_subscribe(Subject *subject, Observer observer) {
    if (subject->count < MAX_OBSERVERS) {
        subject->subscribers[subject->count++] = observer;
    }
}

static void subject_notify(Subject *subject, const char *event) {
    for (int i = 0; i < subject->count; i++) {
        subject->subscribers[i](event);
    }
}

int main(void) {
    Subject subject = {.count = 0};
    subject_subscribe(&subject, log_observer);
    subject_subscribe(&subject, alert_observer);

    subject_notify(&subject, "temperature threshold exceeded");
    subject_notify(&subject, "system nominal");
    return 0;
}
