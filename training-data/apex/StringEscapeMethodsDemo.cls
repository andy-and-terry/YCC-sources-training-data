public class StringEscapeMethodsDemo {
    public static void run() {
        String raw = '<a href="x">Tom & "Jerry"</a>';

        System.debug(raw.escapeXml());
        // &lt;a href=&quot;x&quot;&gt;Tom &amp; &quot;Jerry&quot;&lt;/a&gt;

        String html = raw.escapeHtml4();
        System.debug(html);
        System.debug(html.unescapeHtml4() == raw);  // true

        // escapeCsv quotes the value when it holds commas or quotes
        System.debug('a,b'.escapeCsv());            // "a,b"
        System.debug('plain'.escapeCsv());          // plain

        // escapeSingleQuotes guards values placed inside dynamic SOQL
        System.debug('O\'Brien'.escapeSingleQuotes()); // O\'Brien
    }
}
