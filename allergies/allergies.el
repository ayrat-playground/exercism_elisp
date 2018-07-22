;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;;; Code:

(defun allergen-list(number)
  "Detects allergens"
  (allergens number '()))

(defun allergic-to-p(number allergen)
  "Check if persion allergic to allergen"
  (let ((allergens (allergen-list number)))
    (member allergen allergens)))

(defun allergens(number result)
  "Detects allergens"
  (cond ((>= number 256) (allergens (- number 128) result))
        ((>= number 128) (allergens (- number 128) (cons "cats" result)))
        ((>= number 64) (allergens (- number 64) (cons "pollen" result)))
        ((>= number 32) (allergens (- number 32) (cons "chocolate" result)))
        ((>= number 16) (allergens (- number 16) (cons "tomatoes" result)))
        ((>= number 8) (allergens (- number 8) (cons "strawberries" result)))
        ((>= number 4) (allergens (- number 4) (cons "shellfish" result)))
        ((>= number 2) (allergens (- number 2) (cons "peanuts" result)))
        ((>= number 1) (cons "eggs" result))
        (t result)))





(provide 'allergies)
;;; allergies.el ends here
