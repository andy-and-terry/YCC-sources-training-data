(defn insert [tree value]
  (cond
    (nil? tree) {:value value :left nil :right nil}
    (< value (:value tree)) (update tree :left insert value)
    :else (update tree :right insert value)))

(defn inorder [tree]
  (when tree
    (concat (inorder (:left tree)) [(:value tree)] (inorder (:right tree)))))

(def tree (reduce insert nil [5 3 8 1 4 7 9]))
(println (inorder tree))
