;; Random numbers, a Fisher-Yates shuffle and sampling.
(defun shuffle (sequence)
  (let* ((v (coerce sequence 'vector))
         (n (length v)))
    (loop for i from (1- n) downto 1
          do (rotatef (aref v i) (aref v (random (1+ i)))))
    v))

(defun sample (list k)
  (subseq (coerce (shuffle list) 'list) 0 k))

(let* ((items '(1 2 3 4 5 6 7 8 9 10))
       (shuffled (shuffle items)))
  (print (length shuffled))
  ;; shuffling must preserve the multiset of elements
  (print (equal (sort (copy-seq shuffled) #'<) items))
  (print (= 3 (length (sample items 3)))))

;; a reproducible sequence uses a copied random state
(let* ((state (make-random-state t))
       (copy (make-random-state state))
       (a (loop repeat 5 collect (random 100 state)))
       (b (loop repeat 5 collect (random 100 copy))))
  (print (equal a b)))

;; random float and range
(print (< 0 (random 1.0) 1))
(print (<= 5 (+ 5 (random 6)) 10))

;; estimate pi by Monte Carlo (value varies; just check plausibility)
(let* ((n 20000)
       (hits (loop repeat n
                   count (let ((x (random 1.0)) (y (random 1.0)))
                           (<= (+ (* x x) (* y y)) 1.0)))))
  (print (< 2.9 (* 4.0 (/ hits n)) 3.4)))
