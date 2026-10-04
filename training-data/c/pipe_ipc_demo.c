#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

int main(void) {
    int fd[2];
    if (pipe(fd) == -1) {
        perror("pipe");
        return 1;
    }

    pid_t pid = fork();
    if (pid < 0) {
        perror("fork");
        return 1;
    }

    if (pid == 0) {                 /* child: reader */
        close(fd[1]);
        char buf[64];
        ssize_t n;
        while ((n = read(fd[0], buf, sizeof buf - 1)) > 0) {
            buf[n] = '\0';
            printf("child received: %s", buf);
        }
        close(fd[0]);
        fflush(stdout);
        _exit(0);
    }

    close(fd[0]);                   /* parent: writer */
    const char *msgs[] = {"first message\n", "second message\n"};
    for (int i = 0; i < 2; i++) {
        write(fd[1], msgs[i], strlen(msgs[i]));
    }
    close(fd[1]);                   /* EOF for the reader */

    int status;
    waitpid(pid, &status, 0);
    printf("child exited with %d\n", WEXITSTATUS(status));
    return 0;
}
