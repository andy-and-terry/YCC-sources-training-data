(defn insert [trie word]
  (assoc-in trie (concat (map str word) [:end?]) true))

(defn contains-word? [trie word]
  (let [node (get-in trie (map str word))]
    (boolean (and node (:end? node)))))

(defn starts-with? [trie prefix]
  (boolean (get-in trie (map str prefix))))

(def t (reduce insert {} ["cat" "car" "cart" "dog"]))

(println (contains-word? t "car"))
(println (contains-word? t "ca"))
(println (starts-with? t "ca"))
(println (starts-with? t "do"))
(println (starts-with? t "z"))
