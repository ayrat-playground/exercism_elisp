;;; robot-name.el --- Robot Name (exercism)

;;; Commentary:
;;
;; Build a robot with a name like AA000, that can be reset
;; to a new name. Instructions are in README.md
;;

;;; Code:
(defun build-robot()
  "builds robot name"
  (upcase (concat (random-char) (random-char) (random-num) (random-num) (random-num))))

(defun random-char ()
  (let* ((alph "abcdefghijklmnopqrstuvwxyz")
         (i (% (abs (random)) (length alph))))
    (substring alph i (1+ i))))

(defun random-num ()
  (let* ((num "1234567890")
         (i (% (abs (random)) (length num))))
    (substring num i (1+ i))))


(provide 'robot-name)
;;; robot-name.el ends here
