def s = 'abcabc'
int k = 3, B = 31, M = 1000003
(0..s.size() - k).each { i ->
    long h = 0
    s.substring(i, i + k).each { c -> h = (h * B + (c as char) as int) % M }
    println "$i $h"
}
