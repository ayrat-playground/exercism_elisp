;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:
(require 'subr-x)

(defun response-for(&optional sentence)
  "Bob's response"
  (if sentence
      (cond ((and (yell? sentence) (question? sentence)) "Calm down, I know what I'm doing!")
            ((yell? sentence) "Whoa, chill out!")
            ((question? sentence) "Sure.")
            ((empty? sentence) "Fine. Be that way!")
            (t "Whatever."))
    (quote "Whatever.")))

(defun yell?(string)
  "Checks if string contains yelling"
   (and (equal string (upcase string))
        (not (empty? string))
        (string-match "[[:alpha:]]" string)))

(defun question?(string)
  "Checks if string contains question"
  (string-match "?$" (string-trim string)))

(defun empty?(string)
  "Checks if string is empty"
  (equal (string-trim string) ""))

(provide 'bob)
;;; bob.el ends here
