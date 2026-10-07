public class ThreadLocalDemo {
    static final ThreadLocal<StringBuilder> BUF = ThreadLocal.withInitial(StringBuilder::new);

    public static void main(String[] args) throws InterruptedException {
        Runnable r = () -> {
            StringBuilder sb = BUF.get();
            for (int i = 0; i < 3; i++) sb.append(Thread.currentThread().getName()).append(i);
            System.out.println(sb);
            BUF.remove();
        };
        Thread t1 = new Thread(r, "A");
        Thread t2 = new Thread(r, "B");
        t1.start(); t2.start();
        t1.join(); t2.join();
        System.out.println("main buffer empty: " + BUF.get().isEmpty());
    }
}
