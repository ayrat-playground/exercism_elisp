;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun anagrams-for(word anagrams)
  "Finds anagrams"
  (let ((word-len (length word))
        (chars (mapcar `char-to-string word)))
    (cl-every #'anagramsp anagrams word)))

(defun anagramsp(word1 word2)
  "Checks if two words are anagrams"
  (if (eq (length word1) (length word2))
      (let ((chars (mapcar `char-to-string word1)))
        (cl-every #'string-match chars word2))))

(provide 'anagram)
;;; anagram.el ends here
