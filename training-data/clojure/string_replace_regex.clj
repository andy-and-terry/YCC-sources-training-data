(require '[clojure.string :as str])

(println (str/replace "foo bar foo" "foo" "baz"))
(println (str/replace "a-b_c d" #"[-_ ]" "."))
(println (str/replace "john smith" #"(\w+) (\w+)" "$2, $1"))
(println (str/replace-first "aaa" "a" "b"))
(println (str/replace "hello" #"[aeiou]" str/upper-case))
