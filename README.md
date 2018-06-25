[![Build Status](https://travis-ci.org/akirak/ivy-bookmarked-directory.svg?branch=master)](https://travis-ci.org/akirak/ivy-bookmarked-directory)

# ivy-bookmarked-directory

This is an [Ivy](https://github.com/abo-abo/swiper) interface which displays a list of bookmarked directories.

Counsel package includes `counsel-bookmark`, but `ivy-bookmarked-directory` is different from that in the following aspects:

- It displays only directory bookmarks.
- It displays file paths rather than bookmark names.
- It cannot add/edit/delete a bookmark.

## Configuration

### Adding more actions

As `ivy-bookmarked-directory` is based on Ivy, you can [customize](http://oremacs.com/swiper/#customization) it.

For example, the following snippet adds an action to open a selected directory using `multi-term`:

``` emacs-lisp
(ivy-add-actions 'ivy-bookmarked-directory
                 '(("m" (lambda (cand)
                          (let ((default-directory cand))
                            (multi-term))) "multi-term")))
```

## Usage

Use `ivy-bookmarked-directory`.

With a prefix prefix (`C-u`), you can add a bookmark which points to the current directory (`default-directory`). There is also a separate command named `ivy-bookmarked-directory-add` for creating a directory bookmark.

## License

GPL v3
