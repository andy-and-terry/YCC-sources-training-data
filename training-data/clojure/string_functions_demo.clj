(require '[clojure.string :as str])

(def s "  Hello, Clojure World  ")

(println (str/trim s))
(println (str/upper-case s))
(println (str/split (str/trim s) #",\s*"))
(println (str/replace s "World" "Lisp"))
(println (str/includes? s "Clojure"))
(println (str/starts-with? (str/trim s) "Hello"))
(println (str/join "-" ["a" "b" "c"]))
(println (str/capitalize "hELLO"))
(println (str/blank? "   "))
(println (apply str (reverse "abc")))
