;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:

(defun from(seconds minutes hours day month year)
  "Calculates the moment when someone has lived for 10^9 seconds."
  (let* ((encoded-time (encode-time seconds minutes hours day month year "UTC"))
         (time-plus-gigasecond (time-add encoded-time 1000000000))
         (decoded-time (decode-time time-plus-gigasecond "UTC")))
    (butlast decoded-time 3)))

(provide 'gigasecond)
;;; gigasecond.el ends here
