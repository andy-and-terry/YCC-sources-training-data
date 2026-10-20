import sched


if __name__ == "__main__":
    clock = [0.0]
    log = []
    s = sched.scheduler(timefunc=lambda: clock[0], delayfunc=lambda d: clock.__setitem__(0, clock[0] + d))
    s.enter(5, 1, log.append, ("five",))
    s.enter(2, 1, log.append, ("two",))
    ev = s.enter(3, 1, log.append, ("cancelled",))
    s.enter(2, 0, log.append, ("two-high-priority",))
    s.cancel(ev)
    s.run()
    print(log, clock[0])
