# Installation Guide

## Quick Install

```bash
curl -sSL https://raw.githubusercontent.com/fireishott/arr-scripts_Video/main/install.sh | bash
Manual Install
bash
# Enter your Lidarr container
docker exec -it lidarr bash

# Download the script
wget -O /config/video.sh https://raw.githubusercontent.com/fireishott/arr-scripts_Video/main/video.sh
chmod +x /config/video.sh

# Create configuration
nano /config/video.conf
Configuration Example
bash
enableVideo="true"
videoPath="/mnt/musicvideos"
videoContainer="mkv"
youtubeSubtitleLanguage="en"
videoScriptInterval="15m"
Start the Script
bash
# Run manually
docker exec lidarr /config/video.sh

# Or restart container if using auto-start
docker restart lidarr
