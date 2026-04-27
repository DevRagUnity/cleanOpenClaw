# 1. Stop and remove the gateway service
if command -v openclaw &> /dev/null; then
    openclaw gateway stop
    openclaw gateway uninstall
fi

# 2. Linux-specific: Remove systemd user service residue
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    systemctl --user disable --now openclaw-gateway.service 2>/dev/null
    rm -f ~/.config/systemd/user/openclaw-gateway.service
    systemctl --user daemon-reload
fi

# 3. macOS-specific: Remove Launch Agents residue
if [[ "$OSTYPE" == "darwin"* ]]; then
    launchctl bootout gui/$UID/ai.openclaw.gateway 2>/dev/null
    rm -f ~/Library/LaunchAgents/ai.openclaw.gateway.plist
fi

# 4. Remove all known configuration and state directories
# This includes legacy names like 'clawdbot' and 'moltbot'
rm -rf ~/.openclaw ~/.clawdbot ~/.moltbot ~/.molthub ~/.config/openclaw ~/.local/share/openclaw

# 5. Global package removal (npm/pnpm/bun)
npm uninstall -g openclaw 2>/dev/null
pnpm remove -g openclaw 2>/dev/null
bun remove -g openclaw 2>/dev/null

# 6. Clean up temporary logs
rm -rf /tmp/openclaw

echo "OpenClaw has been fully removed."
