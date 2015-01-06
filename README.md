SEO Friendly Lavender Theme for NodeBB
=========================

An SEO smart derivative of the standard Lavender Theme. Forked from Lavender v0.1.13 - the version that ships with nodebb v0.5.7. SEO friendly features include:

- Server side generated pagination using plain HTML <a> tags. This requires no JS and is friendly to search engines as they do not execute JS when parsing web pages.
- Reply links in category view are made icons. Regular Lavender theme renders reply links anchored with "replied about N mounths|days|hours ago". That anchor text causes google some confusion as it assumes a heavily linked text means something.
- HTML head elements that give hints about pagination to Google. http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html

## Screenshots

**Home View**

[![Home View](http://i.imgur.com/gfQYGHl.png)](http://i.imgur.com/gfQYGHl.png)

**Category View**

[![Category View](http://i.imgur.com/JalyDRpl.png)](http://i.imgur.com/JalyDRp.png)

**Topic View**

[![Topic View](http://i.imgur.com/R8YhchEl.png)](http://i.imgur.com/R8YhchE.png)

## Installation

    npm install nodebb-theme-lavender-seo


## Credits

variables.less modified from "White Plum" by [divshot](https://github.com/divshot/)
