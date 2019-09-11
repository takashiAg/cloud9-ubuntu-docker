```
docker build -t ando/cloud9 .
```

```
docker run --rm -d -v workspace:/workspace -p 8080:8080 ando/cloud9
```
