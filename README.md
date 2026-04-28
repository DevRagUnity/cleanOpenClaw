# cleanOpenClaw

A lightweight utility script to completely uninstall OpenClaw and purge all associated residue from your system.

## Overview

Uninstalling OpenClaw via standard package managers often leaves behind background services, hidden configuration directories, and persistent scheduled tasks. This script ensures a "zero-trace" removal for users who need to clean their environment before migrating to other LLM setups or local models.

## What it Does

- **Service Teardown**: Stops and disables `systemd` user services (Linux) or `LaunchAgents` (macOS).
- **Process Termination**: Force-kills any lingering gateway or worker processes.
- **Directory Purge**: Recursively removes config and data folders:
  - `~/.openclaw`
  - `~/.clawdbot`
  - `~/.moltbot`
  - `~/.config/openclaw`
- **Package Removal**: Uninstalls the global package from `npm`, `pnpm`, or `bun`.

## Usage

### One-Line Execution (Linux/macOS)
You can run the script directly using:

```bash
curl -fsSL https://raw.githubusercontent.com/DevRagUnity/cleanOpenClaw/main/cleanOpenClaw.sh | bash
