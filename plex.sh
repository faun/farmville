docker run --rm -it \
--name=plex \
--net=host \
-e VERSION=latest \
-e PUID=1050 -e PGID=100 \
-e TZ=America/Los_Angeles \
-v /mnt/Plex:/config \
-v /mnt/Television:/data/tvshows \
-v /mnt/Movies:/data/movies \
linuxserver/plex

docker run --rm -it linuxserver/plex 
