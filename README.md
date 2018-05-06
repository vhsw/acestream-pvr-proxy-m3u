# Acestream SimplePVR proxy for Kodi

## How to use this image:
Pull image from docker hub 
```
docker pull vhsw/acestream-pvr-proxy-m3u
```
Then run it:
```
docker run --name ace --rm -d -p8000:8000 vhsw/acestream-pvr-proxy-m3u http://path-to-acestream-playlist
```
You must google acestream by yourself. Also you might whant to provide custom config to this image:
```
docker run -v config:/absolute/path/to/config --rm -d -p8000:8000 vhsw/acestream-pvr-proxy-m3u http://path-to-acestream-playlist
```
Example of contens of the config golder you can find [here](https://github.com/vhsw/acestream-pvr-proxy-m3u/tree/master/config).

## How to bulid this image:
```
git clone git@github.com:vhsw/acestream-pvr-proxy-m3u.git
cd acestream-pvr-proxy-m3u
docker build --rm -f Dockerfile -t acestream-pvr-proxy-m3u:latest .
```
or just use awesome VSCode [Docker extension](https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker) to do all dirty work for you.
