;; -*- lexical-binding: t -*-

;;; Header ;;;

;; Load theme first thing
(load-theme 'doom-sourcerer t)

;; These also should be quick to look good
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Set the font quickly as well!
(set-face-attribute 'default nil
		    :font "Input Mono"
		    :weight 'light
		    :height 105)

(set-face-attribute 'variable-pitch nil
		    :font "Input Serif"
		    :weight 'light
		    :height 105)

(add-hook 'prog-mode-hook
	  #'variable-pitch-mode)

;;; Util ;;;

(setq config-home (if load-file-name
		      (file-name-directory load-file-name)
		    default-directory))

(defun load-config (path)
  (let ((file (expand-file-name path config-home)))
    (load file nil t t)))

(eval-when-compile
  (setq use-package-always-defer t)
  (require 'use-package))

;;; Config ;;;

(load-config "neuter.el")
(load-config "ui.el")
