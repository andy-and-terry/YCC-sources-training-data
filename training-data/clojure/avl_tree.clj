(defn height [node]
  (if (nil? node) 0 (:height node)))

(defn make-node [val left right]
  {:val val :left left :right right
   :height (inc (max (height left) (height right)))})

(defn balance-factor [node]
  (if (nil? node) 0 (- (height (:left node)) (height (:right node)))))

(defn rotate-right [node]
  (let [l (:left node)]
    (make-node (:val l) (:left l) (make-node (:val node) (:right l) (:right node)))))

(defn rotate-left [node]
  (let [r (:right node)]
    (make-node (:val r) (make-node (:val node) (:left node) (:left r)) (:right r))))

(defn rebalance [node]
  (let [bf (balance-factor node)]
    (cond
      (> bf 1) (if (< (balance-factor (:left node)) 0)
                 (rotate-right (assoc node :left (rotate-left (:left node))))
                 (rotate-right node))
      (< bf -1) (if (> (balance-factor (:right node)) 0)
                  (rotate-left (assoc node :right (rotate-right (:right node))))
                  (rotate-left node))
      :else node)))

(defn avl-insert [node val]
  (if (nil? node)
    (make-node val nil nil)
    (cond
      (< val (:val node)) (rebalance (make-node (:val node) (avl-insert (:left node) val) (:right node)))
      (> val (:val node)) (rebalance (make-node (:val node) (:left node) (avl-insert (:right node) val)))
      :else node)))

(defn inorder [node]
  (if (nil? node)
    []
    (concat (inorder (:left node)) [(:val node)] (inorder (:right node)))))

(def tree (reduce avl-insert nil [10 20 30 40 50 25]))

(println (inorder tree))
(println "height:" (height tree))
