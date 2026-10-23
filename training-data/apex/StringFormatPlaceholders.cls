public class StringFormatPlaceholders {
    public static void run() {
        String msg = String.format('Hello {0}, you have {1} new messages',
            new List<String>{ 'Ada', String.valueOf(5) });
        System.debug(msg);

        System.debug(String.join(new List<String>{ 'a', 'b', 'c' }, '-')); // a-b-c
        System.debug('abc'.leftPad(6, '*'));                               // ***abc
        System.debug('Hello'.substringAfter('el'));                        // lo
    }
}
