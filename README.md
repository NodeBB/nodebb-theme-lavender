# CoderDojo Lavender Theme for NodeBB

The CoderDojo Lavender theme is a fork [Lavender](https://github.com/NodeBB/nodebb-theme-lavender) base theme.
A fork is currently required, rather than using NodeBB's theme inheritence model, as the Lavender theme already inherits from the Vanilla theme, and more than one level of inheritence is not currently supported.

[Reference](https://community.nodebb.org/topic/5395/basetheme-causing-issues/2)

Merging updates to Lavender theme should be feasible, most changes are to files that do not exist in original Lavender theme. Use cd-variables.less for global colour scheme changes.

See [NodeBB Theme Documentation](https://docs.nodebb.org/en/latest/themes/create.html) for more information. Also search for `nodebb-theme` on [NPM](https://www.npmjs.com/search?q=nodebb-theme) for inspiration.

## Features

* overrides the login template to show the CoderDojo logo & text
* overrides the login language file to be CoderDojo specific (only English for now)
* sets up styles consistant with CoderDojo site
* adds CoderDojo navbar to header

## Screenshot

[![Home View](http://i.imgur.com/6Oxfdj1.png)](http://i.imgur.com/6Oxfdj1.png)

## Local development

This guide assumes that database dependencies have been installed and are running. (Mongo or Redis)

* install NodeBB locally following the instructions [here](https://docs.nodebb.org/en/latest/installing/os.html) or install directly from github.

* git clone the theme somewhere locally, e.g.

```
~/work $ git clone git@github.com:CoderDojo/nodebb-theme-cd-lavender.git
~/work $ cd nodebb-theme-cd-lavender
~/work/nodebb-theme-cd-lavender $ npm install
~/work/nodebb-theme-cd-lavender $ npm link .
```

* git clone the sso plugin somewhere locally, e.g.

```
~/work $ git clone git@github.com:CoderDojo/nodebb-plugin-sso-coderdojo.git
~/work $ cd nodebb-plugin-sso-coderdojo
~/work/nodebb-theme-cd-lavender $ npm install
~/work/nodebb-theme-cd-lavender $ npm link .
```

* git clone NodeBB, and link plugin and theme

```
~/work $ git clone -b v0.7.x https://github.com/NodeBB/NodeBB.git
~/work $ cd NodeBB
~/work/NodeBB $ npm install
~/work/NodeBB $ npm link nodebb-theme-cd-lavender
~/work/NodeBB $ npm link nodebb-plugin-sso-coderdojo
```

* copy coderdojo setup data, and install nodebb

```
~/work/NodeBB $ cp ./node_modules/nodebb-theme-cd-lavender/install/data/* ./install/data
~/work/NodeBB $ ./nodebb setup
~/work/NodeBB $ ./nodebb start
```

* choose theme using admin page

```
http://localhost:4567/admin
Appearance >> Themes >> <Use Coder Dojo Lavender Theme>
Restart NodeBB (either from admin Dashboard >> Restart or terminal ./nodebb restart)
```

* upload logo using admin page

```
http://localhost:4567/admin
Site Logo >> Upload Logo
Logo can be found at nodebb-theme-cd-lavender/static/images/logo.png
```
* other suggested admin settings

```
http://localhost:4567/admin
Settings >> General >> Site Tite: forum
Setting >> General >> Browser Title: CoderDojoBB
Settings >> User >> Allow local registration: disabled
Settings >> User >> Allow local login: disabled (make sure sso plugin is working first, or you could lock yourself out!)
```



