;; Greedy sequence whose pairwise sums are all distinct.
(define (distinct? lst)
  (or (null? lst)
      (and (not (memv (car lst) (cdr lst))) (distinct? (cdr lst)))))

(define (disjoint? a b)
  (or (null? a) (and (not (memv (car a) b)) (disjoint? (cdr a) b))))

(define (mian-chowla count)
  (let loop ((cand 1) (seq '()) (sums '()))
    (if (= (length seq) count)
        seq
        (let ((fresh (map (lambda (x) (+ x cand)) (append seq (list cand)))))
          (if (and (distinct? fresh) (disjoint? fresh sums))
              (loop (+ cand 1) (append seq (list cand)) (append sums fresh))
              (loop (+ cand 1) seq sums))))))

(for-each (lambda (v) (display v) (display " ")) (mian-chowla 8))
(newline)
