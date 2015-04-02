;(require 'package)
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.milkbox.net/packages/"))
;(setq use-package-verbose t)
(package-initialize)
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(eval-when-compile
  (require 'use-package))

(use-package cl-lib :ensure t)

;; use space for indentation, 2 spaces wide
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; flx
(use-package flx-ido
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-use-faces nil))

;; source: https://github.com/hlian/emacs-d/blob/master/init-packages.el
(use-package company
  :commands company-mode
  :config (progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
  (add-to-list 'company-backends 'company-ghc)
  (custom-set-variables '(company-show-numbers t))
  (custom-set-variables '(company-idle-delay 0))
  (custom-set-variables '(company-frontends '(company-pseudo-tooltip-frontend)))))

(use-package ghc
:commands ghc-init ghc-debug)


(use-package haskell-mode :ensure haskell-mode
  :config
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
  (custom-set-variables '(haskell-process-type 'cabal-repl))
   (setq-default ghc-display-error 'other-buffer)
   (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  ; enable local lisp?
  ; (add-hook 'haskell-mode-hook 'flycheck-haskell-setup)
  ; (add-hook 'haskell-mode-hook 'flycheck-mode)
   (add-hook 'haskell-mode-hook 'company-mode)
   (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
   (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
   (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
   (add-hook 'haskell-mode-hook (lambda () (ghc-init)))

  (setq haskell-stylish-on-save t)
  (setq haskell-process-args-cabal-repl '("--ghc-option=-ferror-spans"))
  ;;                                        "--with-ghc=ghci-ng"))
  ;ghci-ng keys 
  ;(define-key interactive-haskell-mode-map (kbd "M-.") 'haskell-mode-goto-loc)
  
  (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
  (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)
  (define-key haskell-mode-map (kbd "C-c v c") 'haskell-cabal-visit-file)
  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
  (define-key haskell-mode-map (kbd "C-x C-d") nil)
  (setq haskell-font-lock-symbols t)
  ;; Do this to get a variable in scope
  ;;(auto-complete-mode)
)
