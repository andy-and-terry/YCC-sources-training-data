// Categories add methods to existing classes only inside a use { } block.
class StringExtras {
    static String shout(String self) { self.toUpperCase() + "!" }
    static boolean isPalindrome(String self) {
        def s = self.toLowerCase().findAll { it ==~ /[a-z0-9]/ }.join()
        s == s.reverse()
    }
}

class NumberExtras {
    static boolean isEven(Integer self) { self % 2 == 0 }
}

use(StringExtras) {
    println "hello".shout()
    println "A man, a plan, a canal: Panama".isPalindrome()
}

// Several categories at once
use(StringExtras, NumberExtras) {
    println 4.isEven()
    println "abc".shout()
}

// Outside the block the methods are gone
try {
    "hello".shout()
} catch (MissingMethodException e) {
    println "not available outside use"
}
