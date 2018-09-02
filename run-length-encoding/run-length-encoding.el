;;; run-length-encoding.el --- run-length-encoding Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

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
    (if (not (null prev-char))
        (setq result (concat result (char-pair char-count prev-char))))
    result))

(defun run-length-decode(string)
  (let ((result "")
        (current-char nil)
        (reversed-string (reverse string))
        (digits '()))
    (mapc (lambda(x)
            (cond ((not current-char) (setq current-char x))
                  ((and (not (digit-p x)) (not digits))  (progn
                                                           (setq result (concat (make-string 1 current-char) result))
                                                           (setq current-char x)))
                  ((not (digit-p x)) (progn
                                       (setq result (concat (make-string-from-digits digits current-char) result))
                                       (setq current-char x)
                                       (setq digits '())))
                  ((digit-p x) (setq digits (cons (string-to-number (char-to-string x)) digits))))) reversed-string)
    (cond ((and digits current-char) (setq  result (concat (make-string-from-digits digits current-char) result)))
          ((not (null current-char)) (setq result (concat (make-string 1 current-char) result))))
    result))

(defun make-string-from-digits(digits char)
  (let ((count (number-from-digits digits)))
    (make-string count char)))

(defun number-from-digits(digits)
  (let* ((reversed-digits (reverse digits))
        (result (seq-reduce (lambda(acc x)
                              (let* ((multiplicator (cdr acc))
                                     (result (+ (car acc) (* x multiplicator))))
                                `(,result . ,(* 10 multiplicator)))) reversed-digits '(0 . 1))))
    (car result)))

(defun digit-p(char)
  (and (>= char ?0) (<= char ?9)))

(defun char-pair(count char)
  (if (= count 1) (char-to-string char)
    (concat (number-to-string count) (char-to-string char))))


(provide 'run-length-encoding)
;;; run-length-encoding.el ends here
