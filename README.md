# Acestream proxy for Kodi PVR Simple Client 

## How to use this image:
Pull image from docker hub 
```
docker pull vhsw/acestream-pvr-proxy-m3u
```
Then run it:
```
docker run --name ace --rm -d -p8000:8000 vhsw/acestream-pvr-proxy-m3u http://path-to-acestream-playlist.m3u
```
You must google acestream playlist by yourself. Also you might want to provide custom config to this image. It's totally up to you, default config must be fine in most situations:
```
docker run -v config:/absolute/path/to/config --rm -d -p8000:8000 vhsw/acestream-pvr-proxy-m3u http://path-to-acestream-playlist
```
Example of contens of the config folder you can find [here](https://github.com/vhsw/acestream-pvr-proxy-m3u/tree/master/config).

After the docker container is up and running all you need is put url `http://localhost:8000/torrenttv/playlist.m3u` into PVR Simple Client settings and restart addon or restart kodi.

## How to bulid this image:
```
git clone git@github.com:vhsw/acestream-pvr-proxy-m3u.git
cd acestream-pvr-proxy-m3u
docker build --rm -f Dockerfile -t acestream-pvr-proxy-m3u:latest .
```
or just use awesome VSCode [Docker extension](https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker) to do all dirty work for you.
