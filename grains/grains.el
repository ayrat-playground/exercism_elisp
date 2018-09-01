;;; grains.el --- Grains exercise (exercism)

;;; Commentary:

;;; Code:

(defun total()
  "Calculates total number of grains on chessboard"
  (let ((current-square 1)
        (current-square-grains (float 1))
        (result 0))
    (while (<= current-square 3)
      (setq result (+ result current-square-grains))
      (setq current-square-grains (float (* 2 current-square-grains)))
      (setq current-square (1+ current-square)))
    (round result)))

(defun square(number)
  "Calculates total number of grains on chessboard"
  (let ((current-square 1)
        (current-square-grains (float 1)))
    (while (< current-square number)
      (setq current-square-grains (float (* 2 current-square-grains)))
      (setq current-square (1+ current-square)))
    (round current-square-grains)))

(= 18446744073709551615 (string-to-number (calc-eval "2^64 - 1")))


(provide 'grains)
;;; grains.el ends here
