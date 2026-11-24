;; Moser-de Bruijn sequence: binary digits of n read in base 4.
(defn moser [n]
  (Integer/parseInt (Integer/toBinaryString n) 4))

(println (clojure.string/join " " (map moser (range 12))))
