class Plugin:
    plugins = []

    def __init_subclass__(cls, **kw):
        super().__init_subclass__(**kw)
        Plugin.plugins.append(cls.__name__)


class Csv(Plugin): pass
class Json(Plugin): pass

if __name__ == "__main__":
    print(Plugin.plugins)
