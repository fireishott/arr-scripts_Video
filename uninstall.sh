#!/bin/bash
# arr-scripts_Video Uninstaller

echo "====================================================="
echo "  arr-scripts_Video Uninstaller"
echo "====================================================="
echo ""

LIDARR_CONTAINER=$(docker ps --format '{{.Names}}' | grep -i lidarr | head -1)

if [ -z "$LIDARR_CONTAINER" ]; then
    echo "⚠️  Lidarr container not found"
else
    echo "Found Lidarr container: $LIDARR_CONTAINER"
    
    echo "🛑 Stopping script..."
    docker exec $LIDARR_CONTAINER pkill -f video.sh 2>/dev/null || true
    
    echo "🗑️ Removing files..."
    docker exec $LIDARR_CONTAINER rm -f /config/video.sh 2>/dev/null || true
    docker exec $LIDARR_CONTAINER rm -f /custom-services.d/video.sh 2>/dev/null || true
    
    echo "✅ Script files removed"
fi

read -p "❓ Remove configuration file? (y/N): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -n "$LIDARR_CONTAINER" ]; then
        docker exec $LIDARR_CONTAINER rm -f /config/video.conf 2>/dev/null || true
        echo "✅ Configuration removed"
    fi
fi

echo ""
echo "====================================================="
echo "✅ Uninstall Complete"
echo "====================================================="
