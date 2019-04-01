
;;;;https://github.com/tumashu/chinese-pyim#org3a2f7d4
;;(require 'chinese-pyim)
;;(require 'chinese-pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
;;(chinese-pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
;; 
;;;;(setq default-input-method "pyim")
;;;;(global-set-key (kbd "C-\\") 'toggle-input-method)
;; 
;;;;windows 需要GZIP的运行文件， 并加入在windows的环境变量里面（PATH）；
;; 
;;(provide 'init-pyim)





(require 'pyim)
(require 'pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
(pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
(setq default-input-method "pyim")

(provide 'init-pyim)
