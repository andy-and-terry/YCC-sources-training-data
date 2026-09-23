(defun digit-at (n place)
  (mod (floor n place) 10))

(defun radix-pass (vec place)
  (let ((buckets (make-array 10 :initial-element nil))
        (result (make-array (length vec))))
    (loop for x across vec do
      (push x (aref buckets (digit-at x place))))
    (dotimes (i 10) (setf (aref buckets i) (nreverse (aref buckets i))))
    (let ((idx 0))
      (dotimes (d 10)
        (dolist (x (aref buckets d))
          (setf (aref result idx) x)
          (incf idx))))
    result))

(defun radix-sort (vec)
  (let ((max-val (reduce #'max vec))
        (result vec)
        (place 1))
    (loop while (>= (floor max-val place) 1) do
      (setf result (radix-pass result place))
      (setf place (* place 10)))
    result))

(print (radix-sort #(170 45 75 90 802 24 2 66)))
