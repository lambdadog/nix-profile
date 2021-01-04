;; -*- lexical-binding: t -*-

;;; Languagetool ;;;

(use-package langtool
  :commands (langtool-check)
  :custom
  (langtool-bin (executable-find "languagetool")))
