;; Clojure's default arithmetic throws on long overflow; the unchecked
;; variants wrap around like Java's primitive operations.
(def max-long Long/MAX_VALUE)

(println "max-long:" max-long)

(println (try
           (+ max-long 1)
           (catch ArithmeticException e
             (str "checked: " (.getMessage e)))))

(println "unchecked-add:" (unchecked-add max-long 1))
(println "unchecked-multiply:" (unchecked-multiply max-long 2))
(println "unchecked-negate of min:" (unchecked-negate Long/MIN_VALUE))

;; The +' operators auto-promote to BigInt instead of overflowing.
(println "promoting:" (+' max-long 1))
(println "promoting type:" (class (+' max-long 1)))

;; Wrapping arithmetic is useful for hash functions.
(defn fnv1a [s]
  (reduce (fn [h c]
            (unchecked-multiply (bit-xor h (long c)) 1099511628211))
          -3750763034362895579
          s))

(println "fnv1a hello:" (fnv1a "hello"))

;; Casting: unchecked-int truncates, int throws when out of range.
(println (unchecked-int 4294967297))
(println (try (int 4294967297) (catch IllegalArgumentException e "int: out of range")))
