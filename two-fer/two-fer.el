;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:

(defun two-fer(&optional name)
  "One for X, one for me"
  (if name
      (concat "One for " name ", one for me.")
    (quote "One for you, one for me.")))

(provide 'two-fer)
;;; two-fer.el ends here
