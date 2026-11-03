(defn swap-case [s]
  (apply str (map #(if (Character/isUpperCase %) (Character/toLowerCase %) (Character/toUpperCase %)) s)))

(println (swap-case "Hello World 42"))
