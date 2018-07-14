;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:

(defun hamming-distance(strand1 strand2)
  "Calculates Hamming distance between two DNA strands"
  (cond ((not (eq (length strand1) (length strand2)))
         (error "Strands have different sizes"))
        ((string= strand1 strand2) 0)
        (t (distance strand1 strand2 0))))

(defun distance(strand1 strand2 res)
  "Counts the number of different characters"
  (if (eq (length strand1) 1)
      (if (string= strand1 strand2)
          res
        (+ res 1))
    (let* ((first1 (substring strand1 0 1))
           (first2 (substring strand2 0 1))
           (len (length strand1))
           (tail1 (substring strand1 1 len))
           (tail2 (substring strand2 1 len)))
    (if (not (string= first1 first2))
        (distance tail1 tail2 (+ res 1))
      (distance tail1 tail2 res)))))

(provide 'hamming)
;;; hamming.el ends here
