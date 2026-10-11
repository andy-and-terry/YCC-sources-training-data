function mergeKSorted(lists: number[][]): number[] {
  const result: number[] = [];
  const heap: Array<{ value: number; list: number; index: number }> = [];

  const less = (a: number, b: number): boolean => heap[a].value < heap[b].value;
  const swap = (a: number, b: number): void => {
    [heap[a], heap[b]] = [heap[b], heap[a]];
  };
  const push = (item: (typeof heap)[number]): void => {
    heap.push(item);
    let i = heap.length - 1;
    while (i > 0) {
      const parent = (i - 1) >> 1;
      if (!less(i, parent)) break;
      swap(i, parent);
      i = parent;
    }
  };
  const pop = (): (typeof heap)[number] => {
    const top = heap[0];
    const last = heap.pop()!;
    if (heap.length > 0) {
      heap[0] = last;
      let i = 0;
      for (;;) {
        const l = 2 * i + 1;
        const r = l + 1;
        let m = i;
        if (l < heap.length && less(l, m)) m = l;
        if (r < heap.length && less(r, m)) m = r;
        if (m === i) break;
        swap(i, m);
        i = m;
      }
    }
    return top;
  };

  lists.forEach((l, list) => {
    if (l.length > 0) push({ value: l[0], list, index: 0 });
  });
  while (heap.length > 0) {
    const { value, list, index } = pop();
    result.push(value);
    if (index + 1 < lists[list].length) push({ value: lists[list][index + 1], list, index: index + 1 });
  }
  return result;
}

console.log(mergeKSorted([[1, 4, 7], [2, 5], [0, 3, 6, 9]]));
