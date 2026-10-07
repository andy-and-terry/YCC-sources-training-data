"""A custom metaclass hooks into class *creation* itself -- here used
to auto-register every subclass of Plugin in a lookup table, without
each subclass having to remember to register itself."""


class PluginRegistry(type):
    _registry: dict[str, type] = {}

    def __new__(mcs, name, bases, namespace):
        cls = super().__new__(mcs, name, bases, namespace)
        if bases:  # skip the base Plugin class itself
            mcs._registry[namespace.get("name", name.lower())] = cls
        return cls

    @classmethod
    def get(mcs, name):
        return mcs._registry[name]


class Plugin(metaclass=PluginRegistry):
    def run(self):
        raise NotImplementedError


class CsvPlugin(Plugin):
    name = "csv"

    def run(self):
        return "exporting as CSV"


class JsonPlugin(Plugin):
    name = "json"

    def run(self):
        return "exporting as JSON"


if __name__ == "__main__":
    print(sorted(PluginRegistry._registry.keys()))

    plugin_cls = PluginRegistry.get("json")
    print(plugin_cls().run())

    for key in ("csv", "json"):
        print(key, "->", PluginRegistry.get(key)().run())
