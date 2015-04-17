docker-fedoracommons
====================

This repository contains a Dockerfile of Fedora Commons (v3) for Docker's automated build published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download the [automated build](https://registry.hub.docker.com/u/uqlibrary/fedoracommons/) from the public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull uqlibrary/fedoracommons`

   (or, you can build an image from Dockerfile: `docker build -t uqlibrary/fedoracommons .)

### Usage

1. Start a container:

    ```sh
    docker run uqlibrary/fedoracommons
    ```

After few seconds, open `http://<host>:10081/fedora` to see the result.
