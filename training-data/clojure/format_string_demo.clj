(println (format "%d items" 42))
(println (format "%5d|%-5d|%05d" 42 42 42))
(println (format "%.2f" 3.14159))
(println (format "%8.3f|%-8.1f|" 3.14159 2.5))
(println (format "%s is %d years old" "Ann" 30))
(println (format "%10s|%-10s|" "right" "left"))
(println (format "%x %X %o %b" 255 255 8 true))
(println (format "%e" 12345.678))
(println (format "%,d" 1234567))
(println (format "%+d %+d" 5 -5))
(println (format "%%"))
(println (format "%2$s %1$s" "world" "hello"))

;; building a table row by row
(doseq [[name qty price] [["apple" 3 0.5] ["watermelon" 1 3.25] ["fig" 12 0.2]]]
  (println (format "%-12s %3d  $%6.2f" name qty (* qty price))))

;; printf is format plus print
(printf "%s has %d chars%n" "clojure" (count "clojure"))

;; pr-str vs str vs print-str
(println (pr-str "text" :kw 1.0))
(println (str "text" :kw 1.0))
(println (print-str "text" :kw 1.0))
