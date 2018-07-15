;;; pangram.el --- Pangram (exercism)

;;; Commentary:

;;; Code:

(defun is-pangram(string)
  "Checks if a string is pangram"
  (let* ((alphastring (replace-regexp-in-string "[^[:alpha:]]" "" string))
         (chars (delete " " (delete-dups (mapcar `char-to-string (downcase alphastring))))))
    (if (eq (length chars) 26) t nil)))

(provide 'pangram)
;;; pangram.el ends here
