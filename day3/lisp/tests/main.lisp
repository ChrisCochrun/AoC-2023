(defpackage day3/tests/main
  (:use :cl
        :day3
        :rove))
(in-package :day3/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :day3)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
