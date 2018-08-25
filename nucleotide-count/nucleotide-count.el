;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)

;;; Commentary:

;;; Code:
(defun nucleotide-count(dna)
  "Counts nucleotides"
  (let ((a-count 0)
        (c-count 0)
        (g-count 0)
        (t-count 0))
    (mapc (lambda(char)
                  (cond ((= char ?A) (setq a-count (1+ a-count)))
                        ((= char ?C) (setq c-count (1+ c-count)))
                        ((= char ?G) (setq g-count (1+ g-count)))
                        ((= char ?T) (setq t-count (1+ t-count)))
                        (t (error "Unknown nucleotide"))))
          dna)
    `((?A . ,a-count) (?C . ,c-count) (?G . ,g-count) (?T . ,t-count))))

(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
