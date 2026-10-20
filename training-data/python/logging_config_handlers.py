import logging

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, format="%(levelname)s:%(name)s:%(message)s")
    log = logging.getLogger("app.db")
    log.info("connected")
    log.warning("slow query")
