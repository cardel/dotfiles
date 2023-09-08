#!/bin/bash
START_PATH="$HOME/Downloads"
WATCHED_FILE="$START_PATH/.movies-watched.txt"

RG_OUTPUT=$(rg --files --max-depth=3 -N \
	--iglob '*.mp4' --iglob '*.mkv' --iglob '*.avi' \
	--glob '!*Telegram Desktop*' \
	"$START_PATH" | sed "s+$START_PATH/++g")

# remove watched movies from list
while IFS= read -r line; do
	RG_OUTPUT=$(echo "$RG_OUTPUT" | rg --invert-match --fixed-strings "$line")
done < "$WATCHED_FILE"

if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
	SELECTED=$(echo "$RG_OUTPUT" \
		| wofi --show dmenu)
else
	SELECTED=$(echo "$RG_OUTPUT" \
		| rofi -i -dmenu \
			-theme Arc-Dark \
			-font "Droid Sans 15" \
			-theme-str '#window { fullscreen: true; }' \
			-dpi $QT_FONT_DPI)
fi

MOVIE="$START_PATH/$SELECTED"
if [ -f "$MOVIE" ]; then
	killall mpv
	mpv \
		-alang="ukr,uk,eng,en" -slang="eng,en,ukr,uk" \
		--fullscreen "$MOVIE" &
	# add selected to 'watched'
	echo "$SELECTED" >> "$WATCHED_FILE"
fi
