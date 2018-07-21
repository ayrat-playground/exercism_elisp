;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-decimal(binary-string)
  "Converts binary number to decimal"
  (let* ((string-digits (mapcar `char-to-string binary-string))
        (digits (mapcar `string-to-number string-digits)))
    (convert-to-decimal digits (- (length digits) 1) 0)))

(defun convert-to-decimal(digits power res)
  "Convers binary to decimal"
  (let* ((current-digit (car digits))
         (current-res (+ res (* current-digit (expt 2 power)))))
  (if (= power 0) current-res
    (convert-to-decimal (cdr digits) (- power 1) current-res))))


(provide 'binary)
;;; binary.el ends here
