#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

USER=$1

if ! id "$USER" &>/dev/null; then
  echo "User '$USER' does not exist."
  exit 1
fi

# Create a sudoers file in /etc/sudoers.d/
SUDOERS_FILE="/etc/sudoers.d/$USER"
echo "$USER ALL=(ALL) NOPASSWD: ALL" > "$SUDOERS_FILE"

# Set correct permissions
chmod 440 "$SUDOERS_FILE"

# Validate syntax
if visudo -cf "$SUDOERS_FILE"; then
  echo "User '$USER' has been added to sudoers.d with NOPASSWD."
else
  echo "Syntax error in sudoers file. Removing it."
  rm -f "$SUDOERS_FILE"
  exit 1
fi

