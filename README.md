# CoderDojo Lavender Theme for NodeBB

The CoderDojo Lavender theme is a fork [Lavender](https://github.com/NodeBB/nodebb-theme-lavender) base theme.

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

* git clone NodeBB.

```
~/work $ git clone -b v0.7.x https://github.com/NodeBB/NodeBB.git
~/work $ cd NodeBB
~/work/NodeBB $ npm install
~/work/NodeBB $ npm link nodebb-theme-cd-lavender
```

* copy coderdojo setup data.

```
~/work/NodeBB $ cp ./node_modules/nodebb-theme-cd-lavender/install/data/* ./install/data
~/work/NodeBB $ ./nodebb setup
~/work/NodeBB $ ./nodebb start
```

* upload logo using admin page

```
http://localhost:4567/admin/settings/general
Site Logo >> Upload Logo
Logo can be found at static/images/logo.png
```



