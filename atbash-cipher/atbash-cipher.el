;;; atbash-cipher.el --- Atbash-Cipher (exercism)

;;; Commentary:




;;; Code:

(require 'subr-x)
(defconst alphabet "abcdefghijklmnopqrstuvwxyz")
(defconst atbash
  (let ((idx 0)
         (reverse-alph-list (reverse alphabet)))
    (mapcar #'(lambda (arg)
                (let* ((reverse-char (substring reverse-alph-list idx (1+ idx))))
                  (incf idx)
                  (list arg (string-to-char reverse-char)))) alphabet)))

(defun encode (plaintext)
  "Encode PLAINTEXT to atbash-cipher encoding."
  (let* ((prepared-string (downcase (replace-regexp-in-string "[^[:alnum:]_-]" ""  plaintext)))
         (encoded-string (mapconcat #'(lambda(arg)
                                        (char-to-string (or (car (alist-get arg atbash)) arg))) prepared-string ""))
         (result "")
         (counter 0))
    (while (not (= counter (length encoded-string)))
      (if (= 0 (% (1+ counter) 5))
          (setq result (concat result (substring encoded-string counter (1+ counter)) " "))
        (setq result (concat result (substring encoded-string counter (1+ counter)))))
      (setq counter (1+ counter)))
    (string-trim result)))


(provide 'atbash-cipher)
;;; atbash-cipher.el ends here
