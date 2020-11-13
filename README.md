Suricate
========

The simple REST API to MaxMind City database

```shell script
curl -s "localhost:3000/lookup?ip=36.89.229.97&language=en" | jq                               ruby-2.7.1@suricate
{
  "country": "Indonesia",
  "country_iso_code": "ID",
  "city": "Tangerang",
  "lat": -6.177,
  "long": 106.6284
}

curl -s "localhost:3000/health"
OK
```

Docker
------

You need fresh GeoLite2-City.mmdb from [MaxMind site](https://dev.maxmind.com/geoip/geoip2/geolite2/)

```shell script
docker build . --tag suricate
docker run -it --name suricate \
  -v ~/GeoLite2-City.mmdb:/app/maxminddb/GeoLite2-City.mmdb \
  -p 3000:3000 \
  suricate
```

Get console

```shell script
docker exec -it suricate rake c
```
