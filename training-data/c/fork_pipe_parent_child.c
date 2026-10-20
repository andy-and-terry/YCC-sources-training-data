#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

int main(void) {
    int fd[2];
    pipe(fd);
    pid_t pid = fork();
    if (pid == 0) {
        close(fd[0]);
        const char *msg = "from child";
        write(fd[1], msg, strlen(msg));
        _exit(0);
    }
    close(fd[1]);
    char buf[32] = {0};
    read(fd[0], buf, sizeof buf - 1);
    int st;
    waitpid(pid, &st, 0);
    printf("%s (exit %d)\n", buf, WEXITSTATUS(st));
    return 0;
}
