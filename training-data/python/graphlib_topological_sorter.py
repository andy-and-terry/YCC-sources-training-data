from graphlib import CycleError, TopologicalSorter


def build_order(deps):
    """deps maps a task to the set of tasks it depends on."""
    return list(TopologicalSorter(deps).static_order())


def parallel_batches(deps):
    sorter = TopologicalSorter(deps)
    sorter.prepare()
    batches = []
    while sorter.is_active():
        ready = sorted(sorter.get_ready())
        batches.append(ready)
        sorter.done(*ready)
    return batches


if __name__ == "__main__":
    deps = {"app": {"lib", "config"}, "lib": {"core"}, "config": {"core"}, "core": set()}
    print(build_order(deps))
    print(parallel_batches(deps))
    try:
        build_order({"a": {"b"}, "b": {"a"}})
    except CycleError as err:
        print("cycle:", err.args[1])
