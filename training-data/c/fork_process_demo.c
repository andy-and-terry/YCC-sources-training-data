#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(void) {
    pid_t pid = fork();

    if (pid < 0) {
        perror("fork");
        return 1;
    } else if (pid == 0) {
        printf("child: pid=%d parent_pid=%d\n", getpid(), getppid());
        _exit(42);
    } else {
        int status;
        waitpid(pid, &status, 0);
        printf("parent: pid=%d child_pid=%d\n", getpid(), pid);
        if (WIFEXITED(status)) {
            printf("parent: child exited with status %d\n", WEXITSTATUS(status));
        }
    }
    return 0;
}
