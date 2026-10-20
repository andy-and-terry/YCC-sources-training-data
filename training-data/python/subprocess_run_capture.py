import subprocess
import sys


if __name__ == "__main__":
    res = subprocess.run(
        [sys.executable, "-c", "print('hi'); import sys; sys.exit(3)"],
        capture_output=True, text=True,
    )
    print(res.returncode, res.stdout.strip())
    try:
        subprocess.run([sys.executable, "-c", "raise SystemExit(1)"], check=True)
    except subprocess.CalledProcessError as err:
        print("failed with", err.returncode)
    try:
        subprocess.run([sys.executable, "-c", "import time; time.sleep(5)"], timeout=0.2)
    except subprocess.TimeoutExpired:
        print("timed out")
    p1 = subprocess.Popen([sys.executable, "-c", "print('b\\na\\nc')"], stdout=subprocess.PIPE)
    p2 = subprocess.run([sys.executable, "-c", "import sys; print(sorted(sys.stdin.read().split()))"],
                        stdin=p1.stdout, capture_output=True, text=True)
    print(p2.stdout.strip())
