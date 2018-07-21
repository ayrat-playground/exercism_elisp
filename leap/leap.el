;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:


(provide 'leap)
;;; leap.el ends here

(defun leap-year-p(year)
  "Checks if the year is leap"
  (or (and (eq (% year 4) 0)
           (not (eq (% year 100) 0)))
      (eq (% year 400) 0)))
