;;; phone-number.el --- phone-number Exercise (exercism)

;;; Commentary:

;;; Code:
(defun numbers(dirty-number)
  (let ((clean-number (clean-input dirty-number)))
    (normalize-phone-number clean-number)))

(defun area-code(number)
  (substring (numbers number) 0 3))

(defun pprint(number)
  (let ((clean-number (numbers number)))
    (concat "(" (substring clean-number 0 3) ") " (substring clean-number 3 6) "-" (substring clean-number 6 10))))

(defun clean-input(input)
  (replace-regexp-in-string "[^[:digit:]]" "" input))

(defun normalize-phone-number(phone-number)
  (cond ((and (= (length phone-number) 11)
           (string-equal "1" (substring phone-number 0 1))) (substring phone-number 1 11))
        ((= (length phone-number) 10) phone-number)
        (t "0000000000")))

(provide 'phone-number)
;;; phone-number.el ends here
