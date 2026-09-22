class Database:
    def query(self, sql):
        print(f"executing: {sql}")
        return [f"row for '{sql}'"]


class CachingDatabaseProxy:
    """Adds a caching layer in front of an expensive real subject."""

    def __init__(self, database):
        self._database = database
        self._cache = {}

    def query(self, sql):
        if sql in self._cache:
            print(f"cache hit: {sql}")
            return self._cache[sql]
        result = self._database.query(sql)
        self._cache[sql] = result
        return result


if __name__ == "__main__":
    proxy = CachingDatabaseProxy(Database())
    print(proxy.query("SELECT * FROM users"))
    print(proxy.query("SELECT * FROM users"))  # served from cache
