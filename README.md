# kepler.gl in a box

* [http://kepler.gl](http://kepler.gl)
* [https://github.com/uber/kepler.gl](https://github.com/uber/kepler.gl)

To make kepler keeping the newest version, you should docker build firstly, and then run it.

## Build

```bash
docker build -t xunhs/kepler.gl https://github.com/xunhs/docker-kepler.gl.git
```


## Run

```bash
docker run --name kepler.gl -p 8080:80 -d xunhs/kepler.gl

# Optional: pass your mapbox access token to the container
docker run  --name kepler.gl -p 8080:80 \
	-e MapboxAccessToken="yourMapboxAccessToken" -d xunhs/kepler.gl
```

Some modules need to be build at startup. Therefore, it will a take a minute until the container is ready to use
at [http://localhost:8080](http://localhost:8080).
