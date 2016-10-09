[![DOI](https://zenodo.org/badge/5466/bgruening/docker-galaxy-stable.svg)](https://zenodo.org/badge/latestdoi/5466/bgruening/docker-galaxy-stable)
[![Build Status](https://travis-ci.org/maxplanck-ie/docker-galaxy-hicexplorer.svg?branch=master)](https://travis-ci.org/maxplanck-ie/docker-galaxy-hicexplorer)
[![Docker Repository on Quay](https://quay.io/repository/bgruening/galaxy-hicexplorer/status "Docker Repository on Quay")](https://quay.io/repository/bgruening/galaxy-hicexplorer)

Galaxy Workbench with HiCExplorer
=================================

:whale: Galaxy Docker image with HiCExplorer

# Installed tools

 * [HiCExplorer](https://github.com/maxplanck-ie/HiCExplorer)

# Requirements

 - [Docker](https://docs.docker.com/installation/) for Linux / Windows / OSX
 - [Kitematic](https://kitematic.com/) for Windows / OS-X (Optional)

# Usage

To launch:

```
docker run -i -t -p 8080:80 bgruening/galaxy-hicexplorer
```

For more details about this command line or specific usage, please consult the
[`README`](https://github.com/bgruening/docker-galaxy-stable/blob/master/README.md) of the main Galaxy Docker image, on which the current image is based.


# History

 - 0.1: Initial release!


# Support & Bug Reports

You can file an [github issue](https://github.com/maxplanck-ie/docker-galaxy-hicexplorer/issues) or ask us on the [Galaxy development list](http://lists.bx.psu.edu/listinfo/galaxy-dev).
