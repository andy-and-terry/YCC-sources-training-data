;;; Greedy sequence whose pairwise sums are all distinct.
(defun mian-chowla (count)
  (let ((seq '()) (sums '()) (cand 1))
    (loop while (< (length seq) count)
          do (let ((fresh (mapcar (lambda (x) (+ x cand)) (append seq (list cand)))))
               (when (and (= (length fresh) (length (remove-duplicates fresh)))
                          (null (intersection fresh sums)))
                 (setf seq (append seq (list cand))
                       sums (append sums fresh))))
             (incf cand))
    seq))

(format t "~{~a~^ ~}~%" (mian-chowla 8))
