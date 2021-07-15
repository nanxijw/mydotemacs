;; @see https://www.reddit.com/r/emacs/comments/ofhket/further_boost_start_up_time_with_a_simple_tweak/
;; 10% speed up of startup
(setq gc-cons-threshold most-positive-fixnum)

(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
