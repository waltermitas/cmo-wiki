# Skill — Telegram Notifications for Git Repo Updates

Automatically receive a Telegram message whenever a monitored Git repo pulls new commits.

## How it works

1. A shell script runs on a cron schedule (every 30 min)
2. It pulls the repo and compares HEAD before and after
3. If new commits landed → sends a Telegram message listing changed files + commit summaries
4. If nothing changed → stays silent

## Setup

### 1. Create a Telegram bot
- Open Telegram → search **@BotFather** → `/newbot`
- Copy the bot token
- Send any message to the bot, then get your chat ID:
```bash
curl -s "https://api.telegram.org/bot<TOKEN>/getUpdates"
```

### 2. The script

Save to `~/Scripts/dialectic-pull.sh` and run `chmod +x` on it.

```bash
#!/bin/bash

REPO="/path/to/your/repo"
LOG="~/Library/Logs/dialectic-pull.log"
BOT_TOKEN="your-bot-token"
CHAT_ID="your-chat-id"

export HOME="/Users/yourname"
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

send_telegram() {
    curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
        -d chat_id="${CHAT_ID}" \
        -d parse_mode="Markdown" \
        -d text="$1" > /dev/null
}

cd "$REPO" || { echo "$(date): ERROR — repo not found" >> "$LOG"; exit 1; }

BEFORE=$(git rev-parse HEAD)
OUTPUT=$(git pull 2>&1)
AFTER=$(git rev-parse HEAD)

echo "$(date): $OUTPUT" >> "$LOG"

if [ "$BEFORE" != "$AFTER" ]; then
    CHANGES=$(git log --oneline "${BEFORE}..${AFTER}")
    FILES=$(git diff --name-only "${BEFORE}" "${AFTER}" | head -20 | sed 's/^/• /')
    COUNT=$(git diff --name-only "${BEFORE}" "${AFTER}" | wc -l | tr -d ' ')

    MESSAGE="📚 *Repo updated* — ${COUNT} file(s) changed

${FILES}

_Commits:_
${CHANGES}"

    send_telegram "$MESSAGE"
fi
```

### 3. Register the cron job

```bash
(crontab -l; echo "*/30 * * * * /Users/yourname/Scripts/dialectic-pull.sh") | crontab -
```

## Notes

- Use `crontab` not LaunchAgent on macOS — LaunchAgents don't have Desktop folder access
- Log: `~/Library/Logs/dialectic-pull.log`
- The `export HOME` line is required — cron runs in a minimal environment

## Live config (Walter)

- Repo: `/Users/wponce/Desktop/Claude/Claudetest/dialectic`
- Bot: @token_fcb_updates_bot
- Schedule: every 30 min
