"""PEP 562: module-level __getattr__ for lazy or deprecated attributes."""
import sys
import types
import warnings


def make_module():
    mod = types.ModuleType("shim")

    def __getattr__(name):
        if name == "old_name":
            warnings.warn("old_name is deprecated, use new_name", DeprecationWarning, stacklevel=2)
            return mod.new_name
        if name == "expensive":
            value = sum(range(1000))
            mod.expensive = value  # cache so __getattr__ is not called again
            return value
        raise AttributeError(f"module 'shim' has no attribute {name!r}")

    mod.__getattr__ = __getattr__
    mod.new_name = 42
    return mod


if __name__ == "__main__":
    shim = make_module()
    sys.modules["shim"] = shim
    with warnings.catch_warnings(record=True) as caught:
        warnings.simplefilter("always")
        print(shim.old_name, len(caught))
    print(shim.expensive, hasattr(shim, "missing"))
