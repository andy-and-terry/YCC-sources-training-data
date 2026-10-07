(defun size-name (n)
  (case n
    ((1 2 3) :small)
    ((4 5 6) :medium)
    (t :large)))

(defun direction-delta (dir)
  (ecase dir                       ; signals an error on unmatched keys
    (:north '(0 . 1))
    (:south '(0 . -1))
    (:east  '(1 . 0))
    (:west  '(-1 . 0))))

(print (mapcar #'size-name '(2 5 9)))
(print (direction-delta :east))
(print (handler-case (direction-delta :up)
         (error () :bad-direction)))
(terpri)
