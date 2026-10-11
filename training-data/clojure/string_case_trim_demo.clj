(require '[clojure.string :as str])

(println (str/upper-case "clojure"))
(println (str/capitalize "hELLO"))
(println (str "[" (str/trim "  padded  ") "]"))
(println (str "[" (str/triml "  padded  ") "]"))
(println (str/blank? "   "))
(println (str/starts-with? "clojure" "clo") (str/ends-with? "clojure" "ure") (str/includes? "clojure" "oju"))
