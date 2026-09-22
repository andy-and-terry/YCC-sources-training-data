(defn trie-insert [trie word]
  (assoc-in trie (concat (map str word) [:end?]) true))

(defn trie-search [trie word]
  (let [path (map str word)]
    (true? (get-in trie (concat path [:end?])))))

(defn trie-starts-with? [trie prefix]
  (not (nil? (get-in trie (map str prefix)))))

(def words ["cat" "car" "card" "dog"])
(def built (reduce trie-insert {} words))

(println (trie-search built "car"))
(println (trie-search built "ca"))
(println (trie-starts-with? built "ca"))
(println (trie-starts-with? built "do"))
(println (trie-starts-with? built "z"))
