# x-go Releases

This repository hosts release assets and the installer script for xcli.

## Install (latest)

Linux/macOS (requires curl or wget):

```sh
curl -fsSL https://raw.githubusercontent.com/slyang-git/x-go-releases/main/install.sh | sh
```

The script installs `xcli` to `/usr/local/bin` (uses `sudo` if needed).


## Quick Start

After installation, run `xcli run` to start the system. This will launch X data scraping and a web interface at http://localhost:5056.

For first-time setup, visit the initialization page and copy a HomeTimeline cURL command from the X platform to complete initialization.

## Database

After launch, the database is stored in the `~/xcli/` directory.

## Supported platforms

- Linux amd64
- macOS arm64
- Windows amd64

## Verify

```sh
xcli version
xcli help
```

## Uninstall

```sh
sudo rm -f /usr/local/bin/xcli # remove xcli 
sudo rm -rf ~/.xcli/* # remove sqlite database files
```
