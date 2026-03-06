
Troubleshooting
Script Won't Start
bash
# Check if script exists
docker exec lidarr ls -la /config/video.sh

# Check configuration
docker exec lidarr cat /config/video.conf

# Test manually
docker exec lidarr bash /config/video.sh
Can't Connect to Lidarr
bash
# Check if Lidarr is running
docker ps | grep lidarr

# Check API key
docker exec lidarr cat /config/config.xml | grep ApiKey
No Videos Downloading
bash
# Check YouTube connectivity
docker exec lidarr curl -s https://www.youtube.com

# Test search manually
docker exec lidarr yt-dlp --get-title "ytsearch1:your artist official video"

# Check video folder permissions
docker exec lidarr ls -la /mnt/musicvideos/
Permission Errors
bash
# Fix permissions (adjust UID if needed)
docker exec lidarr chown -R abc:abc /mnt/musicvideos/
docker exec lidarr chmod -R 755 /mnt/musicvideos/
Database Locked Errors
These appear in Lidarr logs but are harmless. The script doesn't modify Lidarr's database.
