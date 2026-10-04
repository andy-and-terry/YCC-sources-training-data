;; tagbody/go and block/return-from: the primitives under loop constructs.
(defun count-to (n)
  (let ((i 1))
    (tagbody
     top
       (when (> i n) (go done))
       (format t "~d " i)
       (incf i)
       (go top)
     done
       (terpri))))

(count-to 5)

;; retry pattern with a counter
(defun retry-demo ()
  (let ((attempts 0))
    (tagbody
     again
       (incf attempts)
       (format t "attempt ~d~%" attempts)
       (when (< attempts 3) (go again)))
    attempts))
(print (retry-demo))

;; named blocks allow early exit from nested loops
(defun find-pair (target numbers)
  (block search
    (dolist (a numbers)
      (dolist (b numbers)
        (when (and (< a b) (= (+ a b) target))
          (return-from search (list a b)))))
    nil))
(print (find-pair 10 '(1 3 5 7 9)))
(print (find-pair 100 '(1 3 5)))

;; dolist/dotimes have an implicit nil block
(print (dotimes (i 10) (when (= i 4) (return (* i i)))))
