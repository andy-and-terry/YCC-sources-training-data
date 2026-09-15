(define (rod-cut prices length)
  (if (= length 0)
      0
      (let loop ((cut 1) (best -1))
        (if (> cut length)
            best
            (let ((candidate (+ (list-ref prices (- cut 1)) (rod-cut prices (- length cut)))))
              (loop (+ cut 1) (max best candidate)))))))

(display (rod-cut '(1 5 8 9 10 17 17 20) 8))
(newline)
(display (rod-cut '(1 5 8 9 10 17 17 20) 4))
(newline)
