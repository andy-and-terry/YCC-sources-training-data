"""Dependency ordering with graphlib.TopologicalSorter."""
from graphlib import CycleError, TopologicalSorter


def main():
    # Mapping: task -> set of prerequisites
    deps = {
        "deploy": {"test", "build"},
        "test": {"build"},
        "build": {"fetch", "configure"},
        "fetch": set(),
        "configure": set(),
    }
    print(list(TopologicalSorter(deps).static_order()))

    # Parallel-friendly batches: everything in a batch is independent.
    ts = TopologicalSorter(deps)
    ts.prepare()
    step = 1
    while ts.is_active():
        batch = sorted(ts.get_ready())
        print(f"batch {step}: {batch}")
        ts.done(*batch)
        step += 1

    cyclic = {"a": {"b"}, "b": {"a"}}
    try:
        list(TopologicalSorter(cyclic).static_order())
    except CycleError as exc:
        print("cycle detected:", exc.args[1])


if __name__ == "__main__":
    main()
