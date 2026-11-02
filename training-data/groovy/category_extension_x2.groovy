class StringExt {
    static String shout(String s) { s.toUpperCase() + '!' }
}
use(StringExt) { println 'hey'.shout() }
