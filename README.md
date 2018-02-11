# Dockerised Calibre for Raspberry Pi

This Dockerfile builds [Calibre](https://calibre-ebook.com/) within a Docker container on the Raspberry Pi

Install Docker on the Pi with:

```
curl -sSL https://get.docker.com | sh
``` 

(see https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/)

Build the image with:

docker build . -t calibre

This takes a long while; especially on the `setup.py bdist_wheel for lxml` step.

## Using

To run a recipe, and output the resulting file to `~/pi/calibre`:

```
docker run -v /home/pi/calibre:/calibre  calibre-docker ebook-convert recipefile.recipe /calibre/outfile.epub 
```

Note the ouput file path is the path _within_ the Docker container.  This is mounted on `/home/pi/calibre` on the Pi's actual filesystem.  This path must be absolute and not relative.



