
Configuration Guide
Required Settings
Setting	Description	Example
enableVideo	Enable the script	true
videoPath	Where to save videos	/mnt/musicvideos
Optional Settings
Setting	Description	Default
videoContainer	Output format	mkv
youtubeSubtitleLanguage	Subtitle language	en
videoDownloadTag	Only process tagged artists	none
videoScriptInterval	How often to run	15m
Using Tags
In Lidarr, add a tag to artists you want videos for

Set videoDownloadTag to that tag name

Only tagged artists will be processed

Mount Points
Your videoPath must be mounted in the Lidarr container:

yaml
volumes:
  - /path/to/videos:/mnt/musicvideos
