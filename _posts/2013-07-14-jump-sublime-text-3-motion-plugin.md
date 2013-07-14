---
layout: post
date: 2013-07-14
title: Jump - Sublime Text 3 motion plugin
tags: [sublime_text]
description: Jump - Sublime Text 3 motion plugin
---

Recently released [quick and dirty clone][sublime-Jump] of [vim's EasyMotion][vim-EasyMotion].
I was just too lazy to understand why the existing implementation [does not work under ST3][sublime-EasyMotion-issue].

![privet1mb](https://raw.github.com/england/Jump/master/privet1mb.gif)

### Pros

* A simple jump to any visible character with same shortcut

### Cons

* Blind typing is strongly recommended!
* Placeholders visibility makes me sad (depends on color scheme)

### Current problems

* Can't call 'undo' command from TextCommand context - can't implement continuous re-prepare jump

### TODO

* Jump with selection
* Vintage support (not so interested...)

PS gif is terrible, i know :D



[vim-EasyMotion]: http://www.vim.org/scripts/script.php?script_id=3526
[sublime-EasyMotion-issue]: https://github.com/tednaleid/sublime-EasyMotion/issues/26
[sublime-Jump]: https://github.com/england/Jump
