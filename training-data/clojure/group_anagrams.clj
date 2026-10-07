(defn sorted-key [word]
  (apply str (sort word)))

(defn group-anagrams [words]
  (vals (group-by sorted-key words)))

(println (group-anagrams ["eat" "tea" "tan" "ate" "nat" "bat"]))
