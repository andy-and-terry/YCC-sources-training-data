(defun merge-lists (a b)
  (cond
    ((null a) b)
    ((null b) a)
    ((<= (car a) (car b)) (cons (car a) (merge-lists (cdr a) b)))
    (t (cons (car b) (merge-lists a (cdr b))))))

(defun merge-sort (lst)
  (if (<= (length lst) 1)
      lst
      (let ((mid (floor (length lst) 2)))
        (merge-lists (merge-sort (subseq lst 0 mid))
                     (merge-sort (subseq lst mid))))))

(print (merge-sort '(5 2 9 1 5 6)))
