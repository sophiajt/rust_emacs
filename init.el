;; Make sure melpa is set up
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Stolen from daviwil's emacs-from-scratch
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; The rest of the packages
(use-package treemacs)
(use-package lsp-mode)
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))
(use-package evil)
(use-package undo-tree)
(use-package history)
(use-package emojify)
(use-package smooth-scrolling)
(use-package company)
(use-package rustic)
(use-package cargo)
(use-package restart-emacs)
(use-package olivetti)
(use-package hide-mode-line)
(use-package rg)

;; Optional but fun
(use-package vterm)
(use-package fzf)

;; Bonus: play with Zig
(use-package zig-mode)
(setq lsp-zig-zls-executable "~/.local/bin/zls")

;; Set up the theme and fonts
(use-package color-theme-modern)
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/elpa/color-theme-modern-20200729.921/"))
;;(load-theme 'robin-hood t t)
;;(enable-theme 'robin-hood)
;;(load-theme 'railscast t t)
;;(enable-theme 'railscast)
;;(load-theme 'wombat t t)
;;(enable-theme 'wombat)
;;(load-theme 'pok-wog t t)
;;(enable-theme 'pok-wog)
;;(load-theme 'tsdh-light t t)
;;(enable-theme 'tsdh-light)
(load-theme 'leuven t t)
(enable-theme 'leuven)
;;(use-package doom-themes
;;  :init (load-theme 'doom-snazzy t))

(defun my-vterm-faces ()
  "Buffer-local face remapping for `vterm-mode-hook'."
  (face-remap-add-relative 'default
                           :background "black"
                           :foreground "white"))

(add-hook 'vterm-mode-hook #'my-vterm-faces)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-safe-themes
   '("fbe90e506c7bbc25eb1cbfce3bcd90a2bec9fe09ecfdf7302fc8705d43a39fcd" "026eff18f1c0fda8f9bf5738343019a8ebe8db55c1bd9bcbd4536d8ed112d5df" "e27556a94bd02099248b888555a6458d897e8a7919fd64278d1f1e8784448941" "b80d4f6dee7691fc5a437d760164c3eba202944b3f977d5b47bbb6b76cba0806" "64affc3597b4271ba6b0b428777d616cfb20d8f7f147dbd00f1de220b2b59bbf" "bd28a7a54d9bfbda4456afb650a5990282b391f1e0494fb04b095981255066ae" "294c4b6a955149c93945f901a284140df29963a57939e9ed2fc4ad79b3605080" "e737ca3fb6767587a5e3fb066ec11f216f62faa2f64d18ae3b8c362c274ed2c8" "d422c7673d74d1e093397288d2e02c799340c5dabf70e87558b8e8faa3f83a6c" "74c7fb40d06ce63839f61695301363533eca789c2f057c50e21e295c4e96ce74" "ec38d891ab6805f112b47c18149190a50bf1e2967b6e9fc84453989b6f67b2f6" "57db540d6a8cc20d2e2f20bd63dc3af4eb9e4bbfa7252a0ee877c99b577996c4" "9987adb99037db4fca049c26ab751370b37b7a84c458d8f11f6590d5a02e97d5" "8310462f5008fe10661e27ceab164e05c509343641cc262134fc623422b5999d" "e3d4bc76062df5a4b72d0ec8abd04233ea3d33a8418430a719bd533e0e7c36ee" "7de92d9e450585f9f435f2d9b265f34218cb235541c3d0d42c154bbbfe44d4dd" "be0efbaebc85494f3c1c06e320fd13a24abf485d5f221a90fe811cea9a39ed85" "3fe4861111710e42230627f38ebb8f966391eadefb8b809f4bfb8340a4e85529" "317a45f190eaa3ccf8af6168aa89112d9cb794f87f409bc7a0638edee20d07fd" "69ad4071c7b2d91543fddd9030816404ff22e46f7207549319ce484e23082dee" "cdc2a7ba4ecf0910f13ba207cce7080b58d9ed2234032113b8846a4e44597e41" "06e0662b31a2ae8da5c6b5e9a05b25fabd1dc8dd3c3661ac194201131cafb080" "46f6f73fb47a2a19b6ee1a49781f835fd73a185674268d4e048acf6feac9c55d" "0a8b65f747471394d1539ba19722f7ac733b5d1d9419a83f2b3eb9e9a1443aa9" "0615f6940c6c5e5638c9157644263889db755d43576c25f7b311806f4cfe2c3a" "dd7213b37f448685f41e28b83a497f78fdefeeef0d47531fc24e99f576a7a191" "a4ef58c2fb31b065ad09fa3029adba5eb518e42ef104cf9acf7c409abf40ca55" "14afbe72aeadc67fb3061ddaaaad924c58b45dc6c604fa31675222d851b70161" "6a2cc07c407e8321f0df155988e60b39fe6f2488d2c79a6b14211854ea6fbc52" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "5c5de678730ceb4e05794431dd65f30ffe9f1ed6c016fa766cdf909ba03e4df4" "3d9df5511048d0815b1ccc2204cc739117c1a458be92fb26c03451149a1b1c11" "d86ddb4126c19487edd10a0f1a16f77fdaadafbdac9f4fcd695cf1c0a215117b" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "45482e7ddf47ab1f30fe05f75e5f2d2118635f5797687e88571842ff6f18b4d5" "dbcaaf13f0d62b577dedefe6e1a9ae3e57ac86f316fea6ae83341db916fcb9c7" "20ad8133a73088c0ce4f26d106c3e70cae4e10c7e613c9b9e17a962eb194a24f" "9939e735844cb24144d29ddf03fadf86a2d455758afeeee30372258e8a6401bb" "271d9389c0256fa7df2bbb6b5fd304d08bd6178371f46159d963621669e8c203" "5516001c13a43f1f5be2d7df8035445f8d7c73179f637e40c1503afb184d98f2" "ef92efb0f9178b4a1130ffae1571d71983d123f84acd6565e09cb58ca71982c9" "d9c957b0e8d2d7f1bbb781fc729e06598017ade2d0c18611e5abbdde0f65d981" "8c867d38498653a86c1071714502d01eabb8d8c9ec976a7ddc4d04c23a991a97" "39a854967792547c704cbff8ad4f97429f77dfcf7b3b4d2a62679ecd34b608da" "c086fe46209696a2d01752c0216ed72fd6faeabaaaa40db9fc1518abebaf700d" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "2c49d6ac8c0bf19648c9d2eabec9b246d46cb94d83713eaae4f26b49a8183fc4" "1048305cc1ac0f9088768641fb1c64756ee82b9d0b088b2950f6bae961dccc19" "2ea9afebc23cca3cd0cd39943b8297ce059e31cb62302568b8fa5c25a22db5bc" "087af241cc83130395244db7fca84b545fef75da92d63462436f3ffef916fa33" "ff8be9ed2696bf7bc999423d909a603cb23a9525bb43135c0d256b0b9377c958" "4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "9a4b5a8dfe01489c7046f75764c988a8a93aeb36e48c39dc55f21fb3ecbf2c59" "9493b7c662667d7a2f2bf80390d88f549e1e253f3f647be575d9f29b215ef2c6" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "4ca84f9861113f889d505b66c4a9c30b81400f450b54f4c857d3eb44c5bdc601" "42d116236094bbb32033705237877aa3e83d436649c92e541e941347f0a7e605" "c2bce71b37ffd6e95fbd3b98d6eaadd113ec308f85149cfc8f50dee716764fed" "09feeb867d1ca5c1a33050d857ad6a5d62ad888f4b9136ec42002d6cdf310235" "a0d9281cf41e8a226f0539a7f54e4812fdeaaec36c751b84671df97a54013465" "1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "0685ffa6c9f1324721659a9cd5a8931f4bb64efae9ce43a3dba3801e9412b4d8" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "f4876796ef5ee9c82b125a096a590c9891cec31320569fc6ff602ff99ed73dca" "5379937b99998e0510bd37ae072c7f57e26da7a11e9fb7bced8b94ccc766c804" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "7546a14373f1f2da6896830e7a73674ef274b3da313f8a2c4a79842e8a93953e" default))
 '(font-use-system-font t)
 '(package-selected-packages
   '(lsp-ui cargo emojify ripgrep history evil smooth-scrolling company ## rustic lsp-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono" :foundry "ADBO" :slant normal :weight regular :height 110 :width normal)))))
(dolist (face '(default fixed-pitch))
	(set-face-attribute `,face nil :font "Droid Sans Mono-13"))

;;disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;;basic buffer settings
(set-default 'truncate-lines t)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq shift-select-mode 't) ;; use shift to select
(setq-default fringe-indicator-alist (assq-delete-all 'truncation fringe-indicator-alist))

;;lsp settings
(setq lsp-rust-server 'rust-analyzer)
(setq lsp-ui-sideline-enable 't)
(setq lsp-ui-sideline-show-diagnostics 't)
(setq lsp-ui-sideline-show-hover nil)
(setq lsp-ui-sideline-show-code-actions nil)
(setq lsp-ui-doc-enable 't)
(setq lsp-ui-doc-show-with-cursor nil)
(setq lsp-ui-doc-show-with-mouse 't)
(setq lsp-modeline-diagnostics-enable 't)
(setq lsp-modeline-code-actions-enable nil)
(setq lsp-rust-analyzer-cargo-watch-command "clippy")
(setq lsp-rust-show-hover-context nil)
(setq rustic-lsp-server 'rust-analyzer)
(setq rustic-format-trigger 'on-save)
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-eldoc-enable-hover nil)
(setq lsp-enable-symbol-highlighting nil)

(setq-default mode-line-format '("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag mode-line-misc-info))
(set-fringe-style 0)

;;get the window the right size
(when window-system
  (set-frame-size (selected-frame) 127 34))

;;start up evil
(evil-mode)
(history-mode)
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

;;set up evil keys
(define-key evil-normal-state-map (kbd "<M-right>") (lambda () (interactive) (history-add-history) (lsp-find-definition)))
(define-key evil-normal-state-map (kbd "<M-left>") 'history-prev-history)
(define-key evil-normal-state-map (kbd "<M-up>") 'previous-buffer)
(define-key evil-normal-state-map (kbd "<M-down>") 'next-buffer)
(define-key evil-normal-state-map (kbd "TAB") 'lsp-format-buffer)
(define-key evil-normal-state-map (kbd "C-/") 'comment-line)
(define-key evil-normal-state-map (kbd "C-p") 'fzf-git)
(define-key evil-normal-state-map (kbd "C-f") 'rg)
(define-key evil-normal-state-map (kbd "f") 'rg)
(define-key evil-normal-state-map (kbd "^") 'lsp-rename)
(define-key evil-normal-state-map (kbd "C-\\") 'lsp-ui-peek-find-references)
(define-key evil-normal-state-map (kbd "[") 'flymake-goto-prev-error)
(define-key evil-normal-state-map (kbd "]") 'flymake-goto-next-error)
(define-key evil-normal-state-map (kbd "c") 'lsp-execute-code-action)
(define-key evil-normal-state-map (kbd "e") 'flymake-show-diagnostics-buffer)
(define-key evil-normal-state-map (kbd ">") 'next-window-any-frame)
(define-key evil-normal-state-map (kbd "<") 'previous-window-any-frame)
(define-key evil-normal-state-map (kbd "`") 'delete-other-windows)

;;hide the menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;;set up smooth scrolling
(pixel-scroll-mode 1)

;;add our final hooks
(add-hook 'after-init-hook #'global-emojify-mode)
(add-hook 'evil-local-mode-hook #'turn-on-undo-tree-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)

