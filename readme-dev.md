先安装一个windows或者mac 版本的docker

然后执行

```bash
cd slate
docker-compose up
```

打开浏览器访问 http://localhost:4567/




## advanced

rebuild image

```bash
docker-compose build 
```


## build
```
cd slate
docker build . -t slatebuild

docker run -it --rm -v C:\Users\tyz\qb\histdata-docs:/build slatebuild bash -c 'cd /build/slate &&  bundle exec middleman build --clean'
```