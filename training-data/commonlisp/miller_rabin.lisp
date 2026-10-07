(defun mod-pow (base exp modulus)
  (let ((result 1) (b (mod base modulus)) (e exp))
    (loop while (> e 0) do
      (when (oddp e) (setf result (mod (* result b) modulus)))
      (setf b (mod (* b b) modulus))
      (setf e (floor e 2)))
    result))

(defun witness-composite-p (n d r a)
  (let ((x (mod-pow a d n)))
    (if (or (= x 1) (= x (1- n)))
        nil
        (let ((i 0))
          (loop
            (when (= x (1- n)) (return nil))
            (when (>= i (1- r)) (return t))
            (setf x (mod-pow x 2 n))
            (incf i))))))

;; Deterministic (for any 64-bit n) Miller-Rabin using this fixed witness set.
(defun prime-p (n)
  (cond
    ((< n 2) nil)
    ((member n '(2 3 5 7)) t)
    ((some (lambda (p) (zerop (mod n p))) '(2 3 5 7)) nil)
    (t (let ((d (1- n)) (r 0))
         (loop while (evenp d) do (setf d (floor d 2)) (incf r))
         (notany (lambda (a) (witness-composite-p n d r a))
                 '(2 3 5 7 11 13 17 19 23 29 31 37))))))

(dolist (n '(2 17 561 997 1000003 1000000007))
  (format t "~a ~a~%" n (prime-p n)))
