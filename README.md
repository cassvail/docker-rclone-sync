[rclone-url]: https://rclone.org/
[rclone-docs-url]: https://rclone.org/docs/

# Docker rclone sync

Docker container to execute ```rclone sync``` periodically

**rclone** documentation: [rclone.org/docs][rclone-url]

## Usage

### Parameters

```-v /rclone_config``` path where _.rclone.conf_ is stored (generate _config file_ using [rclone cli][rclone-docs-url])

```-v /data``` path containing data to be syncronized

```-e SYNC_DESTINATION``` sync destination (this should match the section ```[destination]``` in the _.rclone.conf_ file)

```-e SYNC_DESTINATION_PATH``` sub-path on destination

```-e DELAY``` delay time to wait between syncs. DELAY will be passed to ```sleep``` command

#### docker-compose

Sample _drive_ configuration:

_docker-compose.yml_

```
rclone-sync:
  image: cassvail/rclone-sync
  volumes:
    - ./local_config_folder:/rclone_config
    - ./local_data:/data
  environment:
    SYNC_DESTINATION: drive
    SYNC_DESTINATION_PATH: SubDirectory
    DELAY: 1h
```

_local_config_folder/.rclone.conf_

```
[drive]
type = drive
scope = drive.file
use_trash = false
token = DRIVE_JSON_TOKEN
```