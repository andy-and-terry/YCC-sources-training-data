import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class ProxyPattern {
    interface Calculator {
        int add(int a, int b);
    }

    static class RealCalculator implements Calculator {
        @Override
        public int add(int a, int b) {
            return a + b;
        }
    }

    static class LoggingInvocationHandler implements InvocationHandler {
        private final Object target;

        LoggingInvocationHandler(Object target) {
            this.target = target;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            System.out.println("calling " + method.getName() + " with " + java.util.Arrays.toString(args));
            Object result = method.invoke(target, args);
            System.out.println(method.getName() + " returned " + result);
            return result;
        }
    }

    public static void main(String[] args) {
        Calculator real = new RealCalculator();
        Calculator proxy = (Calculator) Proxy.newProxyInstance(
            Calculator.class.getClassLoader(),
            new Class<?>[] { Calculator.class },
            new LoggingInvocationHandler(real)
        );

        System.out.println(proxy.add(2, 3));
    }
}
