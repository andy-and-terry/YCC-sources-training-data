(defun sift-down (arr root heap-size)
  (let ((largest root)
        (left (+ (* 2 root) 1))
        (right (+ (* 2 root) 2)))
    (when (and (< left heap-size) (> (aref arr left) (aref arr largest)))
      (setf largest left))
    (when (and (< right heap-size) (> (aref arr right) (aref arr largest)))
      (setf largest right))
    (unless (= largest root)
      (rotatef (aref arr root) (aref arr largest))
      (sift-down arr largest heap-size))))

(defun heap-sort (arr)
  (let ((n (length arr)))
    (loop for i from (1- (floor n 2)) downto 0 do
      (sift-down arr i n))
    (loop for end from (1- n) downto 1 do
      (rotatef (aref arr 0) (aref arr end))
      (sift-down arr 0 end))
    arr))

(print (heap-sort (make-array 8 :initial-contents '(8 3 5 1 9 2 7 4))))
