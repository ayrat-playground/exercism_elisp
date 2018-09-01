;;; run-length-encoding.el --- run-length-encoding Exercise (exercism)

;;; Commentary:

;;; Code:

(defun run-length-encode(string)
  (let ((result "")
        (prev-char nil)
        (char-count 0))
    (mapc (lambda(x)
            (cond ((not prev-char) (progn
                                     (setq prev-char x)
                                     (setq char-count 1)))
                  ((not (eq prev-char x)) (progn
                                            (setq result (concat result (char-pair char-count prev-char)))
                                            (setq prev-char x)
                                            (setq char-count 1)))
                  (t (setq char-count (1+ char-count))))) string)
    (setq result (concat result (char-pair char-count prev-char)))
    result))


(defun digit-p(char)
  (and (>= char ?0) (<= char ?9)))

(defun char-pair(count char)
  (if (= count 1) (char-to-string char)
    (concat (number-to-string count) (char-to-string char))))


(provide 'run-length-encoding)
;;; run-length-encoding.el ends here
