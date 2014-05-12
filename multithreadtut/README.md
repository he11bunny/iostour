## convert flac to mp3

```sh
ffmpeg -i example.flac -f mp3 -ab 192k -ar 48000 example.mp3
```

## start demo server

```sh
cd ./server
python -m SimpleHTTPServer 1984
```
