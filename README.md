```
> docker build . --tag suricate
> docker run -it -p 3000:3000 --name suricate suricate
> curl "localhost:3000/lookup?ip=87.229.223.210&language=en"
{"country":"Russia","city":"Moscow"}
> curl "localhost:3000/health"
# return 200
```
