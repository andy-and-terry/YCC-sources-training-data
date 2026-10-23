public class RuntimeMemoryInfoDemo {
    public static void main(String[] args) {
        Runtime rt = Runtime.getRuntime();

        int cpus = rt.availableProcessors();
        System.out.println("cpus >= 1: " + (cpus >= 1));

        long max = rt.maxMemory();
        long total = rt.totalMemory();
        long free = rt.freeMemory();
        System.out.println("max >= total: " + (max >= total));
        System.out.println("free <= total: " + (free <= total));

        // Measure the heap effect of allocating a large array
        long before = total - free;
        long[] block = new long[1_000_000];
        block[0] = 1;
        long after = rt.totalMemory() - rt.freeMemory();
        System.out.println("used grew: " + (after > before));

        block = null;
        System.gc(); // only a hint to the JVM
        System.out.println("used mb is non-negative: "
                + ((rt.totalMemory() - rt.freeMemory()) / (1024 * 1024) >= 0));

        // Shutdown hooks run when the JVM exits
        rt.addShutdownHook(new Thread(() -> System.out.println("bye")));
    }
}
