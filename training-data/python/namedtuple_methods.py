from collections import namedtuple

Version = namedtuple("Version", "major minor patch")

if __name__ == "__main__":
    v = Version(1, 2, 3)
    print(v._replace(patch=9), v._asdict())
