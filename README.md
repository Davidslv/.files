# My dotfiles

I was highly inspired by
[Mathias Bynens](https://github.com/mathiasbynens/dotfiles) and
with an interest on [Ben Alman](https://github.com/cowboy/dotfiles) dotfiles.

I was always interested in automating installation and have my own setup as fast as I could,
in the past years I've been using gist for configurations, but every time I get a new
machine I come to a conclusion that it can be better.

So I finally decided to follow the dotfiles trend and create one for my own needs.

## Usage

**Please make sure you fork this repo and make necessary changes.**

```bash
  $ git clone git@github.com:Davidslv/.files.git dotfiles
  $ cd dotfiles
  $ ./bootstrap.sh
```

## Install your editor configuration

I want to support the installation of any given editor configuration you might have,
to achieve this all you need to do is to provide a github repo that you would like to be cloned,
and ensure that you have a `./setup` file with your own setup so that `./bootstrap.sh` can follow
your installation instructions.

## Something is broken?

So you followed my instructions and something did go wrong, maybe I pushed
something that was not working the way I intended and you happen to get an unstable version.

Sorry about that, but bear with me, I do have a solution for you, if that ever happens,
please check the latest [stable release](https://github.com/Davidslv/.files/releases/latest),
my promise is that I will update master as many times as necessary, but I will only
make a release once I'm happy and sure that the functionality is working.

## Roadmap

- Dinamically add github name, user and email to [.gitconfig](.gitconfig).
- Add option to download a given vim configuration
- Find some extra inspiration by reading http://linux.101hacks.com/

## License
  [MIT](LICENSE)
