#!/bin/bash

## The script starts executing at the bottom!

##############
##          ##
## Settings ##
##          ##
##############

folder_to_monitor="./"
file_to_monitor="uris_to_load.txt"
file_to_monitor_temp=".temp_uris"
folder_download_location="./Music/"
temp_cover="TEMP_COVER.png"
remove_flac_files="yes"
sound_input="alsa_output.pci-0000_00_14.2.analog-stereo.monitor"


##########################
##                      ##
## Functions: Meta data ##
##                      ##
##########################

function getArtist {
  metadata=`echo "$META_DATA" | awk '
	  /string  *"xesam:artist/{
	    while (1) {
	      getline line
	      if (line ~ /string "/){
		sub(/.*string "/, "", line)
		sub(/".*$/, "", line)
		print line
		break
	      }
	    }
	  }
	'`

  echo $metadata
  return 0
}

function getAlbum {
  metadata=`echo "$META_DATA" | awk '
	  /string  *"xesam:album/{
	    while (1) {
	      getline line
	      if (line ~ /string "/){
		sub(/.*string "/, "", line)
		sub(/".*$/, "", line)
		print line
		break
	      }
	    }
	  }
	'`

  echo $metadata
  return 0
}

function getTitle {
  metadata=`echo "$META_DATA" | awk '
	  /string  *"xesam:title/{
	    while (1) {
	      getline line
	      if (line ~ /string "/){
		sub(/.*string "/, "", line)
		sub(/".*$/, "", line)
		print line
		break
	      }
	    }
	  }
	'`

  echo $metadata
  return 0
}

function getDiscNumber {
  metadata=`echo "$META_DATA" | awk '
	  /string  *"xesam:discNumber/{
	    while (1) {
	      getline line
	      if (line ~ /variant  *int32/){
	        sub(/  *variant  *int32 /, "", line)
		print line
		break
	      }
	    }
	  }
	'`

  echo $metadata
  return 0
}

function getTrackNumber {
  metadata=`echo "$META_DATA" | awk '
	  /string  *"xesam:trackNumber/{
	    while (1) {
	      getline line
	      if (line ~ /variant  *int32/){
	        sub(/  *variant  *int32 /, "", line)
		print line
		break
	      }
	    }
	  }
	'`

  echo $metadata
  return 0
}

function getArtURL {
  metadata=`echo "$META_DATA" | awk '
	  /string  *"mpris:artUrl/{
	    while (1) {
	      getline line
	      if (line ~ /string "/){
		sub(/.*string "/, "", line)
		sub(/".*$/, "", line)
		print line
		break
	      }
	    }
	  }
	'`

  echo $metadata
  return 0
}

function getTrackID {
  metadata=`echo "$META_DATA" | awk '
	  /string  *"mpris:trackid/{
	    while (1) {
	      getline line
	      if (line ~ /string "/){
		sub(/.*string "/, "", line)
		sub(/".*$/, "", line)
		print line
		break
	      }
	    }
	  }
	'`

  echo $metadata
  return 0
}

function getLength {
  metadata=`echo "$META_DATA" | awk '
	  /string  *"mpris:length/{
	    while (1) {
	      getline line
	      if (line ~ /variant  *uint64/){
	        sub(/  *variant  *uint64 /, "", line)
		print line
		break
	      }
	    }
	  }
	'`

  echo $metadata
  return 0
}

function getCoverURL {
	## Available sizes: 60, 85, 120, 300, and 640
	cover_size="320"
	
	COVER_URL="https://embed.spotify.com/oembed/?url=$trackid"
	
	content=$(wget "$COVER_URL" -q -O -)
	content_nospace=(${content// /:})
	array=(${content_nospace//,/ })

	url_raw=(${array[7]})
	url=$(echo $(echo $(echo $(echo $url_raw | sed "s/\"thumbnail_url\":\"//g") | sed "s/\"//g") | sed "s/cover/$cover_size/g") | sed 's/\\//g')
	
	echo $url
	return 0
}

#########################
##                     ##
## Functions: Commands ##
##                     ##
#########################

function spotify_cmd
{
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.$1 1> /dev/null
}

function spotify_query
{
	qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player PlaybackStatus
}

############################
##                        ##
## Functions: Script code ##
##                        ##
############################

function recordPlaylist {
	mkdir -p $folder_download_location
	cd $folder_download_location
	echo "* Current working dir is" `pwd`

	
	## xterm -hold -e "spotify" &
	## sleep 3;
	## SPOTIFY_PID=`pgrep spotify`
	## echo "Starting Spotify (PID: $SPOTIFY_PID)"


	echo "* Loading playlist: \"$1\""
	$(spotify_cmd "OpenUri string:$1")

	echo "* Sleeping for 5 seconds"
	sleep 5

	previous_track=""

	echo "* Starting recording loop"
	while [[ "$(spotify_query)" != "Paused" ]] 
	do
		echo ""
	
		echo "* Getting meta data"
		META_DATA=`dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'`
		artist=$(getArtist $META_DATA)
		album=$(getAlbum $META_DATA)
		title=$(getTitle $META_DATA)
		discnumber=$(getDiscNumber $META_DATA)
		tracknumber=$(getTrackNumber $META_DATA)
		artURL=$(getArtURL $META_DATA)
		trackid=$(getTrackID $META_DATA)
		length=$(getLength $META_DATA)
		length_secs=$(($length/1000000))
	
		echo "* Previous trackid:\"$previous_track\""
		echo "* Current  trackid:\"$trackid\""
		if [[ "$previous_track" != "$trackid" ]]
		then
			previous_track="$trackid"
		
			echo "* Sleep for 4 seconds"
			sleep 4

			echo "* Pausing and resetting song playback"
			$(spotify_cmd "Pause")
			sleep 1
		
			$(spotify_cmd "Previous")
			if [[ "$(spotify_query)" != "Paused" ]]
			then
				$(spotify_cmd "Pause")
			fi
		
			echo "* Recording: $artist - $album: $tracknumber-$title"
			echo "* Duration:  $length_secs (sec)"

			## Dont use spaces in folder
			flac="Flac/"
			mp3="Mp3/"		
			
			## Removes unwanted characters from names
			sed_characters="-e s/[^A-Za-z0-9._-]/ /g"
			sed_spaces="s/ \+ / /g"
			sed_quotation="s/\"//g"
			
			folder_artist=$(echo $(echo $(echo "$artist" | sed "$sed_characters") | sed "$sed_spaces") | sed "$sed_quotation")
			folder_album=$(echo $(echo $(echo "$album" | sed "$sed_characters") | sed "$sed_spaces") | sed "$sed_quotation")
			folder_artist_album="$folder_artist/$folder_album/"
			
			filename=$(echo $(echo "$tracknumber-$title" | sed "$sed_characters") | sed "$sed_spaces")
		
			folder_flac="$folder_download_location$flac$folder_artist_album"
			folder_mp3="$folder_download_location$mp3$folder_artist_album"
		
			echo "* Create folder: $folder_flac"
			mkdir -p "$folder_flac"
			echo "* Create folder: $folder_mp3"
			mkdir -p "$folder_mp3"
		
			filename_flac="$folder_flac$filename.flac"
			filename_mp3="$folder_mp3$filename.mp3"
			length_secs=$(($length_secs - 1))

			echo "* Recording with avconv";
			echo "* Output: $filename_flac"
			xterm -e "yes | avconv -f pulse -ac 2 -ar 48000 -i \"$sound_input\" -acodec flac -metadata title=\"$title\" -metadata artist=\"$artist\" -metadata album=\"$album\" -metadata track=\"$tracknumber\" -metadata disc=\"$discnumber\" \"$filename_flac\"" &
		
			sleep 2
		
			echo "* Play"
			$(spotify_cmd "PlayPause")

			echo "* Sleeping for $(($length_secs)) seconds before stopping recording!"
			sleep $(($length_secs))
		
			AVCONV_PID=`pgrep avconv`
			kill $AVCONV_PID
			echo "* Stopping recording (PID: $AVCONV_PID)"
		
			echo "* Pause"
			$(spotify_cmd "PlayPause")

			sleep 1
		
			echo "* Converting \"$filename_flac\" to \"$filename_mp3\""
			xterm -e "yes | avconv -i \"$filename_flac\" -id3v2_version 4 -write_id3v1 1 -b 256k -metadata artist=\"$artist\" -metadata title=\"$title\" -metadata album=\"$album\" -metadata track=\"$tracknumber\" -metadata disc=\"$discnumber\" \"$filename_mp3\""
		
			## Album cover
			album_cover="$folder_download_location$temp_cover"
			album_url="$(getCoverURL $trackid)"
			echo "* Downloding and adding album art"
			echo "* Cover url: $album_url"
			wget --quiet --output-document="$album_cover" "$album_url"
			eyeD3 --add-image "$album_cover:FRONT_COVER" "$filename_mp3"
		
			if [ "$remove_flac_files" = "yes" ] && [ "$folder_flac" != "/" ]
			then
				echo "* Deleting $folder_flac"
				rm -rf "$folder_flac"
			fi
			
			echo "* Play"
			$(spotify_cmd "PlayPause")
		else
			echo "* Same track as previous"
			$(spotify_cmd "Next")
		fi
	done

	echo '* The end of the playlist has been reached. Spotify has paused itself!'

	## echo "Quitting Spotify (PID: $SPOTIFY_PID)"
	## kill $SPOTIFY_PID

	sleep 10
	echo "* Quitting any remaining xterm terminals"
	kill `pgrep xterm`
}

function readPlaylists {
	echo "* Loading playlists"
	
	## Adds a new line at the end, the while loop skips the last line for some reason.
	echo $'\n' >> "$file_to_monitor"

	## Convert DOS style markers
	dos2unix "$file_to_monitor"

	mv "$file_to_monitor" "$file_to_monitor_temp"

	touch $file_to_monitor
	chmod +777 $file_to_monitor

	while read line
	do
		if [ "$line" != "" ]; then
			echo "* Starting $line"
			recordPlaylist $line
		fi
	done < "$file_to_monitor_temp"

	echo "y" | rm $file_to_monitor_temp
}

function monitorPlaylistFile {
	echo "* Monitor starting"
	
	cd $folder_to_monitor
	echo "* Current folder:" $(pwd)	
	
	touch $file_to_monitor

	while true; do
	  change=$(inotifywait -e access,close_write,moved_to,create .)
	  change=${change#./ * }
	  if [ "$change" = "$file_to_monitor" ]; 
	  then
		echo "* File changed: $change"
		touch $file_to_monitor
		chmod +777 $file_to_monitor
		readPlaylists
	  fi
	done
}

function soundInput {
	echo "* Sound inputs:"
	pactl list sources | grep Name:
	echo ""
	echo "Please choose the correct one and set the value in the sound_input='...' settings of this script"
	echo "This DOESN'T work via an SSH connection, please run from desktop!"
}

function help {
	echo ""
	echo "Offline music script!"
	echo ""
	echo "   $0 [switch] [parameter]"
	echo "   [-m]          Monitors the file $file_to_monitor for changes and loads playlists (Spotify Uri)"
	echo "   [-l playlist] Loads single playlist (Spotify Uri) provided as a parameter"
	echo "   [-s]          List sound inputs, please update the settings with one of them"
	echo "   [-h]          This help text!"
	echo ""
	echo "   Dependencies (Ubuntu):   inotify-tools (inotifywait), dos2unix, xterm, wget, eyed3, libav-tools (avconv), sed, mawk (awk), qdbus, pulseaudio-utils (pactl)"
	echo "   Installing dependencies: sudo apt-get install inotify-tools dos2unix xterm wget eyed3 libav-tools sed mawk qdbus pulseaudio-utils"
	echo ""
	echo "Why? Because I have usecases where streaming apps isn't an option!"
	echo "Don't feel like paying twice for the same music ;-)"
	echo "So this is meant for your own personal use etc etc."
	echo ""
}

function spotifyNotRunning {
	echo "* Spotify isn't running, please start it!"
}

###################
## End functions ##
###################



#####################
##                 ##
## Startup section ##
##                 ##
#####################
spotify_pid=`pgrep spotify`

if [ ! -f $folder_download_location$temp_cover ]; then
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo "*** Please setup the sound settings ($0 -s) ***"
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
fi

if [ "$1" == "-m" ]; then
	if [ "$spotify_pid" == "" ]; then
		spotifyNotRunning
	else
		monitorPlaylistFile
	fi
elif [ "$1" == "-l" ]; then
	if [ "$spotify_pid" == "" ]; then
		spotifyNotRunning
	else
		recordPlaylist $2
	fi
elif [ "$1" == "-s" ]; then
	if [ "$spotify_pid" == "" ]; then
		spotifyNotRunning
	else
		soundInput
	fi
elif [ "$1" == "-h" ]; then
	help
else
	help
fi
