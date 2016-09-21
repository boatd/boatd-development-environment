boatd-development-environment
=============================

Docker container running an easy to use development environment for boatd,
using sails.

To get a copy, run

    $ docker pull kragniz/boatd-development-environment

To start the environment, run:

    $ docker run -p 2222:2222 -p 8080:8080 -t -i kragniz/boatd-development-environment

The sails web interface will be available at
[localhost:8080](http://localhost:8080/), and the boatd API will be on
[localhost:2222](http://localhost:2222) (as normal).
