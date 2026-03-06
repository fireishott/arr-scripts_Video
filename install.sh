#!/bin/bash
# arr-scripts_Video Installer

set -e

echo "====================================================="
echo "  arr-scripts_Video Installer"
echo "  Music Video Downloader for Lidarr"
echo "====================================================="
echo ""

if [ -f "/.dockerenv" ]; then
    echo "❌ This installer must be run on the Docker HOST, not inside the container"
    exit 1
fi

LIDARR_CONTAINER=$(docker ps --format '{{.Names}}' | grep -i lidarr | head -1)

if [ -z "$LIDARR_CONTAINER" ]; then
    echo "❌ Could not find a running Lidarr container"
    echo "   Make sure Lidarr is running and try again"
    exit 1
fi

echo "✅ Found Lidarr container: $LIDARR_CONTAINER"
echo ""

read -p "📁 Where would you like to store music videos? (e.g., /mnt/user/media/music-videos): " VIDEO_PATH

if [ -z "$VIDEO_PATH" ]; then
    echo "❌ Video path cannot be empty"
    exit 1
fi

echo ""
echo "📝 Installing..."

docker exec $LIDARR_CONTAINER mkdir -p /config

docker exec $LIDARR_CONTAINER wget -q -O /config/video.sh https://raw.githubusercontent.com/fireishott/arr-scripts_Video/main/video.sh
docker exec $LIDARR_CONTAINER chmod +x /config/video.sh

docker exec $LIDARR_CONTAINER tee /config/video.conf > /dev/null << CONF
# arr-scripts_Video Configuration
# https://github.com/fireishott/arr-scripts_Video

enableVideo="true"
videoPath="$VIDEO_PATH"
videoContainer="mkv"
youtubeSubtitleLanguage="en"
# videoDownloadTag="music-videos"
videoScriptInterval="15m"
CONF

if docker exec $LIDARR_CONTAINER [ -d /custom-services.d ]; then
    docker exec $LIDARR_CONTAINER ln -sf /config/video.sh /custom-services.d/video.sh
    echo "✅ Auto-start configured"
else
    echo "ℹ️  Auto-start not available - run manually with: docker exec $LIDARR_CONTAINER /config/video.sh"
fi

echo ""
echo "====================================================="
echo "✅ Installation Complete!"
echo "====================================================="
echo ""
echo "📁 Script: /config/video.sh"
echo "⚙️  Config: /config/video.conf"
echo "📁 Videos: $VIDEO_PATH"
echo ""
echo "🚀 Start manually: docker exec $LIDARR_CONTAINER /config/video.sh"
echo "📝 Watch logs: docker logs $LIDARR_CONTAINER -f | grep Video"
echo ""
echo "📚 Documentation: https://github.com/fireishott/arr-scripts_Video"
echo "====================================================="
