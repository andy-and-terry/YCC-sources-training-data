import io
import logging


class RedactFilter(logging.Filter):
    def filter(self, record):
        record.msg = str(record.msg).replace("secret", "******")
        return True


if __name__ == "__main__":
    stream = io.StringIO()
    handler = logging.StreamHandler(stream)
    handler.setFormatter(logging.Formatter("%(levelname)s [%(req)s] %(message)s"))
    handler.addFilter(RedactFilter())
    log = logging.getLogger("demo")
    log.setLevel(logging.DEBUG)
    log.addHandler(handler)
    adapter = logging.LoggerAdapter(log, {"req": "r-42"})
    adapter.info("token is secret")
    adapter.warning("n=%d", 3)
    print(stream.getvalue(), end="")
