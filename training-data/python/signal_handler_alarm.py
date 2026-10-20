import os
import signal


def on_usr1(signum, frame):
    print("got", signal.Signals(signum).name)


if __name__ == "__main__" and hasattr(signal, "SIGUSR1"):
    signal.signal(signal.SIGUSR1, on_usr1)
    os.kill(os.getpid(), signal.SIGUSR1)

    class Timeout(Exception):
        pass

    def on_alarm(signum, frame):
        raise Timeout

    signal.signal(signal.SIGALRM, on_alarm)
    signal.setitimer(signal.ITIMER_REAL, 0.05)
    try:
        while True:
            pass
    except Timeout:
        print("timer fired")
