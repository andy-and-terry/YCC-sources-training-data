(define (trap-rain-water heights)
  (let ((vec (list->vector heights)))
    (let loop ((left 0) (right (- (vector-length vec) 1))
               (left-max (vector-ref vec 0))
               (right-max (vector-ref vec (- (vector-length vec) 1)))
               (trapped 0))
      (if (>= left right)
          trapped
          (if (<= left-max right-max)
              (let* ((new-left (+ left 1))
                     (new-left-max (max left-max (vector-ref vec new-left))))
                (loop new-left right new-left-max right-max
                      (+ trapped (- new-left-max (vector-ref vec new-left)))))
              (let* ((new-right (- right 1))
                     (new-right-max (max right-max (vector-ref vec new-right))))
                (loop left new-right left-max new-right-max
                      (+ trapped (- new-right-max (vector-ref vec new-right))))))))))

(display (trap-rain-water '(0 1 0 2 1 0 1 3 2 1 2 1)))
(newline)
(display (trap-rain-water '(4 2 0 3 2 5)))
(newline)
