;;入口文件代码
(package-initialize)

;;多文件储存配置路径
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
;; --------------------------
(require 'init-packages)


;;doi-get-bib-entities
;;---------------------------
(require 'doi-utils)
(require 'org-ref-bibtex)
(require 'org-ref-helm)


;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;关闭工具栏
;;(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'box)
(blink-cursor-mode 1)
;; 关闭启动帮助画面
;;(setq inhibit-splash-screen 1)

;; 关闭缩进 (第二天中被去除)
(electric-indent-mode -1)

;; 禁止生成备份文件
(setq make-backup-files nil)

;;输入中文光标不闪烁
(setq redisplay-dont-pause nil)

;;选中文字再输入字符会进行替换
(delete-selection-mode 1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;;高亮当前行
(global-hl-line-mode 1)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key(kbd "<f2>")'open-init-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Documents/emacs_learning/notes.org" "~/Documents/emacs_learning/org-ref-learning.org")))
 '(package-selected-packages
   (quote
    (ivy-bibtex helm ## org org-ref auto-org-md markdown-mode+ auto-correct company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


; 开启全局 Company 补全
(global-company-mode 1)
;;关闭警告声音
(setq ring-bell-function 'ignore)


;;orgmode文本语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;;orgmode自动换行

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; org-ref设置
(setq reftex-default-bibliography '("~/Documents/emacs_learning/references.bib"))
;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/Documents/emacs_learning/notes.org"
      org-ref-default-bibliography '("~/Documents/emacs_learning/references.bib")
      org-ref-pdf-directory "~/Documents/emacs_learning/bibtex-pdfs/")



(add-hook 'org-mode-hook 'iimage-mode) ; enable iimage-mode for org-mode
(defun my-screenshot ()
  "Take a screenshot into a unique-named file in the current buffer file
  directory and insert a link to this file."
  (interactive)
  (setq filename
    (concat (make-temp-name
         (concat  (getenv "HOME") "/.emacs.img/" ) ) ".png"))
  (suspend-frame)
  (call-process-shell-command "scrot" nil nil nil nil " -s " (concat
                                "\"" filename "\"" ))
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images)
  )
 
(global-set-key (kbd "C-p") 'my-screenshot)
