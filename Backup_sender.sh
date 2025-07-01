#!/bin/bash

# ---------------- CONFIGURATION ---------------- #

ENCODED_TOKEN="NzQ2NDgwMDcwOTpBQUdCc2ZMZUJ1QXBGVlV1Y1FsTmhXbXNZV0ZqT0ozcHd2SQ=="
BOT_TOKEN=$(echo "$ENCODED_TOKEN" | base64 --decode)

CONFIG_FILE="$HOME/.backup_config"
BACKUP_PATH="$HOME/dev"
DATE=$(date +%d%m%Y)
BACKUP_NAME="backup_$DATE.tar.gz"
FULL_PATH="$BACKUP_PATH/$BACKUP_NAME"

# ------------------------------------------------ #

# dev
mkdir -p "$BACKUP_PATH"

# Chat ID
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Enter your Telegram Chat ID:"
    read CHAT_ID
    echo "$CHAT_ID" > "$CONFIG_FILE"
else
    CHAT_ID=$(cat "$CONFIG_FILE")
fi

# Chat ID
echo "Do you want to change the Telegram Chat ID? (y/N)"
read CHANGE_ID
if [[ "$CHANGE_ID" == "y" || "$CHANGE_ID" == "Y" ]]; then
    echo "Enter new Telegram Chat ID:"
    read NEW_ID
    echo "$NEW_ID" > "$CONFIG_FILE"
    CHAT_ID="$NEW_ID"
fi

# tar
tar -czf "$FULL_PATH" -C "$HOME" dev

# verification
if [ -f "$FULL_PATH" ]; then
    echo "Backup created at $FULL_PATH"

    # to Telegram
    curl -F chat_id="$CHAT_ID" \
         -F document=@"$FULL_PATH" \
         "https://api.telegram.org/bot$BOT_TOKEN/sendDocument"

    echo "✅ Backup sent to Telegram!"
else
    echo "❌ Error: Backup not created."
fi
