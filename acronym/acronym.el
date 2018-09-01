;;; acronym.el --- Acronym (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun acronym(phrase)
  (let* ((words (split-string phrase "[-[:blank:]]+"))
         (acronym (mapconcat (lambda(word)
                               (substring word 0 1)) words "")))
    (upcase acronym)))

(provide 'acronym)
;;; acronym.el ends here
