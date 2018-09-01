;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)

;;; Commentary:

;;; Code:
(require 'seq)

(defun armstrong-p(number)
  (let* ((remainder (% number 10))
         (result (/ number 10))
         (digits `(,remainder)))
    (while (not ( = result  0))
      (setq digits (cons (% result 10) digits))
      (setq result (/ result 10)))
    (let* ((size (length digits))
           (result (seq-reduce (lambda(acc x)
                                 (+ acc (expt x size))) digits 0)))
      (= result number))))


(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
