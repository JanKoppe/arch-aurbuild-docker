# arch-aurbuild-docker

![travis ci](https://img.shields.io/travis/JanKoppe/arch-aurbuild-docker/master.svg)
![docker pulls](https://img.shields.io/docker/pulls/jankoppe/arch-aurbuild.svg)
![docker stars](https://img.shields.io/docker/stars/jankoppe/arch-aurbuild.svg)
[![](https://images.microbadger.com/badges/image/jankoppe/arch-aurbuild.svg)](https://microbadger.com/images/jankoppe/arch-aurbuild "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/jankoppe/arch-aurbuild.svg)](https://microbadger.com/images/jankoppe/arch-aurbuild "Get your own version badge on microbadger.com")

This repository contains a Dockerfile for building packages from the [Arch User Repository](https://aur.archlinux.org) using pacaur.

## Usage

By default, pacaur will be run with `-Sm --noconfirm --noedit --silent` via ENTRYPOINT. You can just pass the name of the package as an argument to `docker run`. Resulting package, and any dependencies from the AUR will be placed in `/home/arch/out`.

```sh
docker run -it --rm -v $(pwd):/home/arch/out jankoppe/arch-aurbuild $PKGNAME
```
