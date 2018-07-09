;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:

(defun square-of-sums(num)
  "Calculates square of sums to num"
  (square-of-sums-iter 0 1 num))

(defun square-of-sums-iter(res cur num)
  "Square of sums iteration"
  (if (> cur num)
      (* res res)
    (square-of-sums-iter (+ res cur) (+ cur 1) num)))

(defun sum-of-squares(num)
  "Calculates sum of squares to num"
  (sum-of-squares-iter 1 2 num))

(defun sum-of-squares-iter(res cur num)
  "Sum of squares iteration"
  (if (> cur num)
      res
    (sum-of-squares-iter (+ res (* cur cur)) (+ cur 1) num)))

(defun difference(num)
  "Calculates difference of sums of the specified number"
  (- (square-of-sums num) (sum-of-squares num)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
