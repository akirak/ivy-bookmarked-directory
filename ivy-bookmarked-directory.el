;;; ivy-bookmarked-directory.el --- Open a bookmarked directory via Ivy -*- lexical-binding: t -*-

;; Copyright (C) 2018 by Akira Komamura

;; Author: Akira Komamura <akira.komamura@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.4") (ivy "0.10"))
;; URL: https://github.com/akirak/ivy-bookmarked-directory

;; This file is not part of GNU Emacs.

;;; License:

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This library provides `ivy-bookmarked-directory` command which is an Ivy
;; interface for bookmarked directories.

;;; Code:

(require 'ivy)
(require 'cl-lib)
(require 'bookmark)

(defun ivy-bookmarked-directory--path-separator ()
  "Get the path separator for the current system."
  (let* ((parent (expand-file-name "a"))
         (i (length parent)))
    (substring (expand-file-name "b" parent) i (1+ i))))

;; FIXME: Add support for Windows and DOS
(defconst ivy-bookmarked-directory-separator
  (ivy-bookmarked-directory--path-separator))

(defun ivy-bookmarked-directory--candidates ()
  "Get a list of bookmarked directories sorted by file path."
  (bookmark-maybe-load-default-file)
  (cl-loop for record in bookmark-alist
           with result = nil
           for filename = (bookmark-get-filename record)
           when (string-suffix-p ivy-bookmarked-directory-separator filename)
           collect filename into result
           finally return (cl-sort result #'string<)))

;;;###autoload
(defun ivy-bookmarked-directory ()
  "Ivy interface for bookmarked directories."
  (interactive)
  (ivy-read "Bookmarked directory: "
            (ivy-bookmarked-directory--candidates)
            :caller 'ivy-bookmarked-directory
            :action 'dired))

(ivy-set-actions 'ivy-bookmarked-directory
                 '(("j" dired-other-window "dired-other-window")
                   ("x" counsel-find-file-extern "open externally")
                   ("r" counsel-find-file-as-root "open as root")
                   ("f" counsel-find-file "find-file")))

(provide 'ivy-bookmarked-directory)
;;; ivy-bookmarked-directory.el ends here
