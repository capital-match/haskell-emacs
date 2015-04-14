(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'load-path "~/.emacs.d/haskell/")
(add-to-list 'exec-path "~/dev/spikes/haskell/ghci-ng/.cabal-sandbox/bin")

(add-to-list 'load-path "~/dev/spikes/haskell/my-emacs-mode/")

(package-initialize)
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(eval-when-compile
  (require 'use-package))

(load-file "cm-haskell.el")

(add-to-list 'load-path "./yaml-mode")
(require 'yaml-mode) (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(use-package smartparens
  :init (smartparens-global-mode t))
