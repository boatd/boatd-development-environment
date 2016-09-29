boatd-development-environment
=============================

[![](https://images.microbadger.com/badges/image/kragniz/boatd-development-environment.svg)](https://microbadger.com/images/kragniz/boatd-development-environment)

Docker container running an easy to use development environment for boatd,
using sails.

To get the latest copy, run

    $ docker pull kragniz/boatd-development-environment

To start the environment, run:

    $ docker run -p 2222:2222 -p 8080:8080 -t -i kragniz/boatd-development-environment

The sails web interface will be available at
[localhost:8080](http://localhost:8080/), and the boatd API will be on
[localhost:2222](http://localhost:2222) (as normal).

Note, this container uses the latest version of `boatd`, `python-boatdclient`
and `python-sailsd` tagged and released on pypi. This is not the latest commit
in the git repos of the respective projects.
