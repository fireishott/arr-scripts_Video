# 🎬 arr-scripts_Video

This is a modified version of RandomNinjaAtk's video download script for Lidarr Extended. It downloads official music videos from YouTube and creates properly formatted NFO files with MusicBrainz metadata for Plex/Jellyfin/Emby compatibility.



Based on original work by RandomNinjaAtk
[![GitHub release](https://github.com/RandomNinjaAtk/arr-scripts)]
Donate to original author: https://github.com/sponsors/RandomNinjaAtk"
[![GitHub](https://img.shields.io/github/license/fireishott/arr-scripts_Video)](LICENSE)
[![GitHub release](https://img.shields.io/github/v/release/fireishott/arr-scripts_Video)](https://github.com/fireishott/arr-scripts_Video/releases)

## ✨ Features

| Feature | Description |
|---------|-------------|
| **🎵 Pure Downloader** | Never deletes or modifies existing files - adds only new content |
| **📝 Perfect NFOs** | Creates metadata files with MusicBrainz artist IDs and genres |
| **🖼️ Thumbnails** | Downloads high-quality YouTube thumbnails for every video |
| **🔍 Smart Search** | Finds official music videos, skips lyric/audio-only content |
| **🏷️ Artist Tag Support** | Only process artists with specific tags in Lidarr |
| **📁 No Assumptions** | Works with your existing Lidarr Docker setup - no config guessing |
| **⚡ Optimized** | Single-pass YouTube search, 1-second delays to avoid rate limiting |
| **🛡️ Safe Operation** | Zero destructive actions - no file deletion, no renaming |

## Quick Start

Run this on your Docker host:

```bash
curl -sSL https://raw.githubusercontent.com/fireishott/arr-scripts_Video/main/install.sh | bash

