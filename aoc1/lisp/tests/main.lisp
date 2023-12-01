(defpackage aoc1-lisp/tests/main
  (:use :cl
        :aoc1-lisp
        :rove))
(in-package :aoc1-lisp/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :aoc1-lisp)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
