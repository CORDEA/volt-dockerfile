# Dockerfile for volt language

## Usage

```bash
$ docker build -t volt:latest volt-dockerfile
```

If you want to try volt

```
$ docker run -it --name volt volt:latest
$ mkdir -p app/src
$ cd app
$ # write battery.txt and volt script ...
$ $HOME/volt/battery config $HOME/volt/Volta $HOME/volt/Watt .
$ $HOME/volt/battery build
```
