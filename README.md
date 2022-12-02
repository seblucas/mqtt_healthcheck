# mqtt_healthcheck

Ping a URL each time a message is send on a topic.

I use it with [HealthChecks.io](https://healthchecks.io/) to check if my house alarm system is working (each door sensor, proximity sensor sends a ping every hour or so)

# Usage

## Prerequisite

You simply need Python3 (never tested with Python2.7) and the only dependencies is `paho-mqtt` (for MQTT broker interaction) so this line should be enough  :

```bash
pip3 install paho-mqtt
```

## Using the script

Easy, first try a dry-run command :

```bash
./mqtt_healthcheck.py -m localhost -t /home/sensor/# -n -v
```

and then a more complete command in docker-compose

```bash
  mqtt_healthcheck:
    build: https://github.com/seblucas/mqtt_healthcheck.git
    image: seblucas/mqtt-healthcheck:latest
    restart: always
    command: "-m mosquitto -t 'home/#' "
    environment:
      MQTT_HEALTHCHECK_HASHMAP: >-
        {
          "home/motion/room1/voltage": "https://hc-ping.com/XX",
          "home/magnet/room1/voltage": "https://hc-ping.com/YY",
          "home/magnet/room2/voltage": "https://hc-ping.com/ZZ"
        }
```

## Help

```
usage: mqtt_healthcheck.py [-h] [-m HOST] -a HASHMAP [-n] [-t TOPIC] [-T TOPIC] [-v]

Send MQTT payload received from a topic to firebase.

optional arguments:
  -h, --help            show this help message and exit
  -m HOST, --mqtt-host HOST
                        Specify the MQTT host to connect to. (default: 127.0.0.1)
  -a HASHMAP, --hash-map HASHMAP
                        topic and ping url aliases. (default: None)
  -n, --dry-run         No data will be sent to the MQTT broker. (default: False)
  -t TOPIC, --topic TOPIC
                        The listening MQTT topic. (default: sensor/#)
  -T TOPIC, --topic-error TOPIC
                        The MQTT topic on which to publish the message (if it wasn't a success). (default: error/transformer)
  -v, --verbose         Enable debug messages. (default: False)
```

# Limits

 * None I hope ;).

# License

This program is licenced with GNU GENERAL PUBLIC LICENSE version 2 by Free Software Foundation, Inc.