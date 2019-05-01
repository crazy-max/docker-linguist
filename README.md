<p align="center">
  <a href="https://hub.docker.com/r/crazymax/linguist/"><img src="https://img.shields.io/badge/dynamic/json.svg?label=version&query=$.results[1].name&url=https://hub.docker.com/v2/repositories/crazymax/linguist/tags&style=flat-square" alt="Latest Version"></a>
  <a href="https://travis-ci.com/crazy-max/docker-linguist"><img src="https://img.shields.io/travis/com/crazy-max/docker-linguist/master.svg?style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/linguist/"><img src="https://img.shields.io/docker/stars/crazymax/linguist.svg?style=flat-square" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/linguist/"><img src="https://img.shields.io/docker/pulls/crazymax/linguist.svg?style=flat-square" alt="Docker Pulls"></a>
  <a href="https://quay.io/repository/crazymax/linguist"><img src="https://quay.io/repository/crazymax/linguist/status?style=flat-square" alt="Docker Repository on Quay"></a>
  <a href="https://www.codacy.com/app/crazy-max/docker-linguist"><img src="https://img.shields.io/codacy/grade/922cb1922a4e408bbf20235d44865c74.svg?style=flat-square" alt="Code Quality"></a>
  <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=9YLPS8L42EYL2"><img src="https://img.shields.io/badge/donate-paypal-7057ff.svg?style=flat-square" alt="Donate Paypal"></a>
</p>

## About

🐳 Docker image to run [GitHub Linguist](https://github.com/github/linguist), a library used on GitHub.com to detect blob languages.<br />
If you are interested, [check out](https://hub.docker.com/r/crazymax/) my other 🐳 Docker images!

## Usage

The entrypoint is **github-linguist** itself :

```
$ docker run -t --rm crazymax/linguist:latest --help
  Linguist v7.3.1
  Detect language type for a file, or, given a repository, determine language breakdown.

  Usage: linguist <path>
         linguist <path> [--breakdown] [--json]
         linguist [--breakdown] [--json]
```

Example with [this repository](https://github.com/portapps/portapps) cloned and analyzed by linguist :

```
$ git clone https://github.com/portapps/portapps.git
$ docker run -t --rm -v "$(pwd)/portapps:/repo" crazymax/linguist:latest
85.51%  Go
10.00%  Inno Setup
4.49%   Shell
```

## How can I help ?

All kinds of contributions are welcome :raised_hands:!<br />
The most basic way to show your support is to star :star2: the project, or to raise issues :speech_balloon:<br />
But we're not gonna lie to each other, I'd rather you buy me a beer or two :beers:!

[![Paypal](.res/paypal.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=9YLPS8L42EYL2)

## License

MIT. See `LICENSE` for more details.
