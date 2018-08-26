;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:
(defun word-count(string)
  (let ((words (clean-input string))
        (result '()))
    (mapc (lambda(word)
            (let ((count (or (assoc-default word result 'string-equal) 0)))
              (if (= count 0) (setq result (cons `(,word . 1) result))
                (setcdr (assoc word result) (1+ count))))) words)
    result))

(defun clean-input(string)
  (let ((string-without-punc (replace-regexp-in-string "[[:punct:]]" "" string)))
    (if (string-equal string-without-punc "") '()
      (let ((words (split-string string-without-punc "[[:blank:]]+")))
        (mapcar (lambda(word)
                  (string-match "[[:alnum:]]+" word)
                  (downcase (match-string 0 word))) words)))))

(provide 'word-count)
;;; word-count.el ends here
