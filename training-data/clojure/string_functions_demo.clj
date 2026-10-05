(require '[clojure.string :as str])

(def s "  Hello, Clojure World  ")

(println (str/trim s))
(println (str/upper-case s))
(println (str/split (str/trim s) #"[, ]+"))
(println (str/join "-" ["a" "b" "c"]))
(println (str/replace "foo bar foo" "foo" "baz"))
(println (str/includes? s "Clojure"))
(println (str/starts-with? (str/trim s) "Hello"))
(println (str/reverse "abc"))
(println (str/capitalize "wORLD"))
(println (str/blank? "   "))
