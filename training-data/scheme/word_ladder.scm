;; Word ladder: shortest chain of single-letter substitutions from a
;; start word to a target word, via BFS over the word dictionary.

(define (one-letter-diff? a b)
  (let loop ((i 0) (diffs 0))
    (cond ((= i (string-length a)) (= diffs 1))
          ((char=? (string-ref a i) (string-ref b i)) (loop (+ i 1) diffs))
          (else (loop (+ i 1) (+ diffs 1))))))

(define (neighbors-of word dict)
  (filter (lambda (w) (one-letter-diff? word w)) dict))

(define (word-ladder-length start target dict)
  (let loop ((queue (list (cons start 1))) (visited (list start)))
    (if (null? queue)
        #f
        (let* ((pair (car queue)) (word (car pair)) (dist (cdr pair)))
          (if (string=? word target)
              dist
              (let* ((candidates (filter (lambda (w) (not (member w visited)))
                                          (neighbors-of word dict)))
                     (next (map (lambda (w) (cons w (+ dist 1))) candidates)))
                (loop (append (cdr queue) next) (append visited candidates))))))))

(define dictionary '("hot" "dot" "dog" "lot" "log" "cog"))
(display (word-ladder-length "hit" "cog" (cons "hit" dictionary)))
(newline)
