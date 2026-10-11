import io
import logging

stream = io.StringIO()
handler = logging.StreamHandler(stream)
handler.setFormatter(logging.Formatter("%(levelname)s:%(name)s:%(message)s"))

log = logging.getLogger("app.db")
log.setLevel(logging.DEBUG)
log.addHandler(handler)
log.propagate = False

log.debug("connecting")
log.info("rows=%d", 3)
log.warning("slow query")
try:
    1 / 0
except ZeroDivisionError:
    log.exception("failed")

lines = stream.getvalue().splitlines()
print(lines[:3])
print(lines[3])
print(logging.getLogger("app.db").parent.name)
print(log.isEnabledFor(logging.DEBUG), logging.getLevelName(30))
