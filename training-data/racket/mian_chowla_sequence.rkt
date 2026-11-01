#lang racket

;; Greedy sequence whose pairwise sums are all distinct.
(define (mian-chowla count)
  (let loop ([cand 1] [seq '()] [sums (set)])
    (if (= (length seq) count)
        seq
        (let* ([fresh (map (lambda (x) (+ x cand)) (append seq (list cand)))]
               [fresh-set (list->set fresh)])
          (if (and (= (set-count fresh-set) (length fresh))
                   (set-empty? (set-intersect fresh-set sums)))
              (loop (add1 cand) (append seq (list cand)) (set-union sums fresh-set))
              (loop (add1 cand) seq sums))))))

(displayln (string-join (map number->string (mian-chowla 8)) " "))
