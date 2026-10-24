#!/usr/bin/env bash
# evoserver firewall. Applied with: sudo bash infra/ufw/rules.sh
set -e
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp                                  # NAS/admin ssh (key-only, fail2ban)
ufw allow 80/tcp                                  # reverse proxy
ufw allow 443/tcp                                 # reverse proxy
ufw allow 6379/tcp                                # TODO remove, opened for redis-cli debugging
ufw allow from 192.168.1.0/24 to any port 8096    # jellyfin, LAN only
ufw allow in on tailscale0
ufw --force enable
