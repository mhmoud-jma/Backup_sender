# Backup sender - Telegram Bot

🚀 **Backup sender** is a **simple Bash script** that automatically creates backups and sends them directly to Telegram via a secure bot.  
Run it locally, and receive your backups in your Telegram chat—no email, no cloud, no hassle.

---

## 🔥 Features

- Lightweight, easy to use, and no external dependencies (besides `tar` and `curl`).  
- Sends backup files or compressed archives to your Telegram.  
- No storage limits—transfer is only limited by your internet connection.  
- Works reliably even in regions where email services are blocked.  
- Secrets like the Telegram bot token and Chat ID are kept secured (not stored in plain text).

---

## 📂 Important: `~/dev` Folder

The script expects your backup data to be in a folder named:

~/dev

⚠️ Please make sure to:

1. Create it once:

```bash
mkdir -p ~/dev
```
2. Place all files and folders you want to back up inside it.



---

🔧 Installation

Follow these steps to install and run Backup sender:

# 1.Clone the repository 
```
git clone https://github.com/mhmoud-jma/Backup_sender.git
```
# 2. Enter thefolder
```
cd Backup_sender
```
# 3. Make the script executable
```
chmod +x backup_sender.sh
```
# 4. (Optional) Add to PATH for easy use
# You can move it to /usr/local/bin or similar:
```
sudo mv backup_sender.sh /usr/local/bin/backup_sender
```

---

🚀 Setup and Usage

1. Start the Telegram Bot

Open Telegram and go to:

@Backup_senderr_bot

Send:

/start


2. Retrieve Your Chat ID

Send your username to :

@IDHunter_Bot

The bot will reply with your numeric Chat ID—copy it.


3. Run the Script
```
./backup_sender.sh
```
– The script will ask for your Chat ID only the first time and save it.

– To change it later, type y when prompted:

Do you want to change the Telegram Chat ID? (y/N)


4. You will get the backup copy in Telegram from the bot : 
@Backup_senderr_bot
---

🛠 Example Usage

Once setup is complete:

backup_sender

! The script will:

1. Compress the ~/dev folder to ~/dev/backup_<DDMMYYYY>.tar.gz


2. Send the file to your Telegram chat via the bot.




---

⚙️ Under the Hood

Uses tar to compress your folder.

Uses curl to send files to Telegram via Bot API.

Handles token with base64 encoding—not plain-text

No limit on backup size; only dependent on your upload speed.



---

🚨 Security Notice

All sensitive data (bot token & Chat ID) are stored securely and not exposed in plain text.
However, base64 encoding is only basic masking, not strong encryption.
Do NOT publish secrets in public repos.
For production or sensitive use, use stronger encryption (e.g. GPG) or environment variables.


---

📎 Project Link

👉 github.com/mhmoud‑jma/Backup_sender

## ⚠️ Security Notice

Currently, this script uses Base64 encoding to hide sensitive tokens or credentials. Please note that **Base64 is NOT encryption** and should not be considered secure for protecting secrets.

This approach is temporary while I am still learning advanced encryption techniques. A future update will replace Base64 with proper encryption methods (e.g. OpenSSL, GPG) to improve the security of stored secrets.

**Until then, use this script with caution and never share your encoded secrets publicly.**

See the [Roadmap](#roadmap) for planned security improvements.

⚠️ License Notice:
Backup_sender is free for personal and educational use. Companies may use it as-is (non-modifiable). Any modifications or commercial distribution require prior written permission.

## 🚀 Roadmap

- [ ] Implement encryption for secrets using OpenSSL or GPG
- [ ] Improve logging and error handling
- [ ] Add support for cloud storage providers (e.g. AWS S3, Google Drive)
- [ ] Create interactive CLI menus for easier usage