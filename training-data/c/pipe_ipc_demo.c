#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

int main(void) {
    int fd[2];
    if (pipe(fd) == -1) { perror("pipe"); return 1; }

    pid_t pid = fork();
    if (pid == 0) {                 /* child writes */
        close(fd[0]);
        const char *msg = "hello from child";
        write(fd[1], msg, strlen(msg) + 1);
        close(fd[1]);
        _exit(0);
    }
    close(fd[1]);                   /* parent reads */
    char buf[64];
    ssize_t n = read(fd[0], buf, sizeof buf);
    close(fd[0]);
    waitpid(pid, NULL, 0);
    if (n > 0) printf("parent received: %s\n", buf);
    return 0;
}
