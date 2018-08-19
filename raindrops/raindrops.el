;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:


(defun convert (n)
  "Convert integer N to its raindrops string."
  (let* ((raindrops '((3 . "Pling") (5 . "Plang") (7 . "Plong")))
         (result (mapconcat #'(lambda (x) (let ((factor (car x))
                                               (dropname (cdr x)))
                                           (if (= (% n factor) 0)
                                               dropname
                                             "")))
                           raindrops "")))
    (if (string-equal "" result)
        (number-to-string n)
      result)))

(provide 'raindrops)
;;; raindrops.el ends here
