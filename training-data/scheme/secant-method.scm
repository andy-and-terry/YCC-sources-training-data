(define (secant f a b)
  (let loop ((a a) (b b) (i 0))
    (let ((fa (f a)) (fb (f b)))
      (if (or (> i 40) (= fa fb))
          b
          (loop b (- b (/ (* fb (- b a)) (- fb fa))) (+ i 1))))))

(display (secant (lambda (x) (- (* x x) 2.)) 1. 2.))
(newline)
