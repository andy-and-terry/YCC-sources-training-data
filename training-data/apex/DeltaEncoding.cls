public class DeltaEncoding {
    public static List<Integer> encode(List<Integer> xs) {
        List<Integer> d = new List<Integer>{ xs[0] };
        for (Integer i = 1; i < xs.size(); i++) d.add(xs[i] - xs[i - 1]);
        return d;
    }

    public static List<Integer> decode(List<Integer> ds) {
        List<Integer> out = new List<Integer>();
        Integer acc = 0;
        for (Integer d : ds) { acc += d; out.add(acc); }
        return out;
    }
}
