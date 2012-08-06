---
title: My RVM Setup and Usage
date: 2010-07-16 20:41 +05:30
---
[RVM](https://rvm.io/) has proved mighty useful in the short time I've used it. My projects usually don't care too much about multiple versions of Ruby, they all primarily use ree-1.8.7, but I have a ton of bed time hacks which use all kinds of Rubies. Here is how I've found RVM useful.

RVM definitely helps out here by separating gem installations across multiple versions of Ruby. [RVM Gemsets](https://rvm.io//gemsets/basics/) turned out to be the most useful feature though, specially while upgrading application through major versions of Rails. The CI Box also uses RVM for running builds for projects with different dependencies. Here, RVM also helps to isolate the gems dependencies of the CI app (like cruisecontrol.rb) from the application it is building by using [project .rvmrc](https://rvm.io//workflow/projects/).

In fact RVM and [Bundler](http://gembundler.com/) work quite well together. In the absence of RVM, Bundler would install gems in the `~/bundle` folder. With RVM, bundler installs all gems in `~/.rvm/gems/ree-1.8.7-2010.02/gems` - which is a RVM managed folder structure, which is ruby version/ RVM gemset aware.

#### Guidelines I like to follow

**No global system gems**

The RVM manual discourages the use of gem installations via sudo. In fact, like most people if you are coming to RVM with a preinstalled set of system gems, you can remove them by 

```bash
rvm use system
rvm gemset empty
```

This ensures that the system has no global gems and the gems managed RVM are the only dependencies. This is specially helpful in removing those old gems which had binaries in global binary paths like `/usr/bin`

**Each project has its own project .rvmrc which is checked in**

This is convenient as RVM will automatically switch gemsets based on this. On new projects, right before you run bundle install, run this from the project root 

```bash
rvm --create --rvmrc ruby@project_name
```

This creates a `gemset` and a `.rvmrc` for the project

**Avoid installing gems in the `ruby@global gemset`**

These is the global gemset where gems are installed for a ruby when no particular gemset is specified. The problem with this is in how RVM initializes the PATH and GEM_PATH while loading a gemset

```bash
PATH="~/.rvm/gems/ree-1.8.7-2010.02@project/bin:~/.rvm/gems/ree-1.8.7-2010.02@global/bin:~/.rvm/rubies/ree-1.8.7-2010.02/bin:~/.rvm/bin:$PATH"
GEM_HOME="~/.rvm/gems/ree-1.8.7-2010.02@project"
GEM_PATH="~/.rvm/gems/ree-1.8.7-2010.02@project:~/.rvm/gems/ree-1.8.7-2010.02@global"
```

This means that RVM will also look for gem binaries in the global gemset. Now this would be a problem if developer environments have different global gemsets. This is nasty, since the whole point of create a new gemset was to isolate the project from such differences. So its best to keep the `global` gemset as minimal as possible. Now, sharing of gems across projects or space is not really an issue here since RVM internally keeps only one copy of a gem even if its used in multiple gemsets. I have a @spikes gemset and I set my user .rvmrc to rvm use `ruby@spikes` so that it is the default gemset.
Hope this helps !
