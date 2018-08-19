;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(defun perfect-numbers(x)
  "Finds perfect numbers up to a given number"
  (let ((result '())
        (number x))
    (while (>= number 2)
      (if (perfect? number)
          (setq result (cons number result)))
      (setq number (1- number)))
    result))

(defun perfect?(x)
  "Checks if a number is perfect"
  (let ((upper-limit (1+ (/ x 2)))
        (count 2)
        (factors '(1)))
    (while (<= count upper-limit)
      (if (= (% x count) 0)
          (setq factors (cons count factors)))
      (setq count (1+ count)))
    (= x (apply '+ factors))))


(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
