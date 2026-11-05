public class InvocableGreetFlowDemo {
    @InvocableMethod(label='Shout')
    public static List<String> shout(List<String> inputs) {
        List<String> out = new List<String>();
        for (String s : inputs) out.add(s.toUpperCase() + '!');
        return out;
    }
}
