(defpackage day2
  (:use :cl))
(in-package :day2)

(defvar input (alexandria:read-file-into-string #p"/home/chris/dev/AoC-2023/day2/input.txt"))
(defvar game-list (uiop:split-string input :separator "
"))
(defvar red 12)
(defvar green 13)
(defvar blue 14)
(defvar sum 0)
(setf sum 0)

(loop :for game :in game-list
      :when (not (string= "" game))
        :do (progn (let* ((game (cl-ppcre:split ":" game))
                          (game-id-string (coerce (car game) 'string))
                          (id (parse-integer
                               (coerce (first (cdr (cl-ppcre:split " " game-id-string))) 'string)))
                          (reveals (cl-ppcre:split ";" (string-trim
                                                        " "
                                                        (coerce
                                                         (first (cdr game))
                                                         'string))))
                          (game-valid t))
                     (uiop:println id)
                     (loop :for reveal :in reveals
                           :do (progn
                                 (let* ((reveal (string-trim " " reveal))
                                        (colors (cl-ppcre:split "," reveal)))
                                   (uiop:println reveal)
                                   (loop :for color :in colors
                                         :do (progn
                                               (let* ((color-string (string-trim " " color))
                                                      (elements (cl-ppcre:split " " color-string))
                                                      (number (parse-integer (first elements)))
                                                      (color (coerce
                                                              (first (cdr elements)) 'string)))
                                                 (format t "~&~a: ~a~&" color number)
                                                 (if (string= color "red")
                                                     (if (> number red)
                                                         (setf game-valid nil)))
                                                 (if (string= color "green")
                                                     (if (> number green)
                                                         (setf game-valid nil)))
                                                 (if (string= color "blue")
                                                     (if (> number blue)
                                                         (setf game-valid nil)))
                                                 ))))))
                     (if game-valid (setf sum (+ sum id)))
                     (uiop:println sum))))

;; blah blah blah.
