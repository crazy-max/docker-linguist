<p align="center">
  <a href="https://hub.docker.com/r/crazymax/linguist/tags?page=1&ordering=last_updated"><img src="https://img.shields.io/github/v/tag/crazy-max/docker-linguist?label=version&style=flat-square" alt="Latest Version"></a>
  <a href="https://github.com/crazy-max/docker-linguist/actions?workflow=build"><img src="https://img.shields.io/github/workflow/status/crazy-max/docker-linguist/build?label=build&logo=github&style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/linguist/"><img src="https://img.shields.io/docker/stars/crazymax/linguist.svg?style=flat-square&logo=docker" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/linguist/"><img src="https://img.shields.io/docker/pulls/crazymax/linguist.svg?style=flat-square&logo=docker" alt="Docker Pulls"></a>
  <br /><a href="https://github.com/sponsors/crazy-max"><img src="https://img.shields.io/badge/sponsor-crazy--max-181717.svg?logo=github&style=flat-square" alt="Become a sponsor"></a>
  <a href="https://www.paypal.me/crazyws"><img src="https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square" alt="Donate Paypal"></a>
</p>

## About

Docker image to run [GitHub Linguist](https://github.com/github/linguist), a library used on GitHub.com to detect blob languages.<br />
If you are interested, [check out](https://hub.docker.com/r/crazymax/) my other Docker images!

💡 Want to be notified of new releases? Check out 🔔 [Diun (Docker Image Update Notifier)](https://github.com/crazy-max/diun) project!

## Multi-platform image

Following platforms for this image are available:

```
$ docker run --rm mplatform/mquery crazymax/linguist:latest
Image: crazymax/linguist:latest
 * Manifest List: Yes
 * Supported platforms:
   - linux/amd64
   - linux/arm/v6
   - linux/arm/v7
   - linux/arm64
   - linux/386
   - linux/ppc64le
   - linux/s390x
```

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

## How can I help?

All kinds of contributions are welcome :raised_hands:! The most basic way to show your support is to star :star2: the project, or to raise issues :speech_balloon: You can also support this project by [**becoming a sponsor on GitHub**](https://github.com/sponsors/crazy-max) :clap: or by making a [Paypal donation](https://www.paypal.me/crazyws) to ensure this journey continues indefinitely! :rocket:

Thanks again for your support, it is much appreciated! :pray:

## License

MIT. See `LICENSE` for more details.
