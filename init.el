(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'load-path "~/.emacs.d/haskell/")
;(add-to-list 'exec-path "~/dev/spikes/haskell/ghci-ng/.cabal-sandbox/bin")

;(require 'package)
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.milkbox.net/packages/"))

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

;(use-package company-ghc :ensure t
;    :init
;    (add-to-list 'company-backends 'company-ghc))

;(use-package ghc :ensure t)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)


(use-package haskell-mode :ensure haskell-mode
  :init
  (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-hook 'haskell-mode-hook (lambda () (ghc-init)))
 ; (add-hook 'haskell-mode-hook (lambda () (ghc-comp-init)))

  :config
  (require 'haskell-flycheck)
  (setq haskell-stylish-on-save nil)
  ; (setq haskell-process-args-cabal-repl '("--ghc-option=-ferror-spans"
  ;                                           "--with-ghc=ghci-ng"))
  ;ghci-ng keys 
  ;(define-key interactive-haskell-mode-map (kbd "M-.") 'haskell-mode-goto-loc)
  ;(define-key interactive-haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at)
  (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
  (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)
  (define-key haskell-mode-map (kbd "C-c v c") 'haskell-cabal-visit-file)
  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
  (define-key haskell-mode-map (kbd "C-x C-d") nil)
  (setq haskell-font-lock-symbols t)
  ;; Do this to get a variable in scope
  (auto-complete-mode))
