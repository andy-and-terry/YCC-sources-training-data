;; The general DO and DO* iteration forms.
;; do binds in parallel and steps in parallel.
(print (do ((i 0 (1+ i))
            (acc '() (cons i acc)))
           ((= i 5) (nreverse acc))))

;; fibonacci with parallel stepping: (a b) -> (b a+b)
(print (do ((n 10 (1- n))
            (a 0 b)
            (b 1 (+ a b)))
           ((zerop n) a)))

;; do* binds and steps sequentially
(print (do* ((i 0 (1+ i))
             (sq (* i i) (* i i))
             (out '() (cons sq out)))
            ((= i 5) (reverse out))))

;; loop with a body and an explicit return
(print (do ((i 1 (1+ i)))
           ((> i 100) :none)
         (when (and (zerop (mod i 7)) (zerop (mod i 5)))
           (return i))))

;; iterating through a list with a tail pointer
(do ((rest '(a b c d) (cdr rest))
     (n 1 (1+ n)))
    ((null rest))
  (format t "~d: ~a~%" n (car rest)))
