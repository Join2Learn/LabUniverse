
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(ede-project-directories
   (quote
    ("d:/Vnext/Projects/spiral" "/plink:10.0.0.101#8022:/usr/local/spiral/current" "d:/Vnext/Projects/spiral/java")))
 '(package-selected-packages
   (quote
    (clojure-mode tramp-term ibuffer-tramp ecb-snapshot pyde project ecb jdee))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; Emacs is not a package manager, and here we load its package manager)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ;; TODO: Maybe, use this after emacs24 is released
                  ;; (development versions of packages)
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)
(add-to-list 'load-path "c:/emacs/emacsplug/tramp/lisp")
(require 'tramp)


(set-default 'tramp-default-method "plink")
;; Auto create dir
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

(prefer-coding-system 'euc-jp-dos)
;; set line number mode
;; Preset width nl
;; or (global-linum-mode t)
(global-linum-mode t)
(setq column-number-mode t)
