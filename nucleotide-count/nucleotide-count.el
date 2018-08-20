;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)

;;; Commentary:

;;; Code:
(defun nucleotide-count(dna)
  "Counts nucleotides"
  (let ((result '((?A . 0) (?C . 0) (?G . 0) (?T . 0))))
    (mapc (lambda(char)
                (cond ((= char ?A) (setq result (update-count result ?A)))
                      ((= char ?C) (setq result (update-count result ?C)))
                      ((= char ?G) (setq result (update-count result ?G)))
                      ((= char ?T) (setq result (update-count result ?T)))
                      (t (error "Unknown nucleotide")))) dna)
    result))

(defun update-count(count char)
  (let* ((previous-value (car (assoc char count)))
         (new-value (1+ previous-value)))
    (cons (char . new-value) (assq-delete-all char count)))))

(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
