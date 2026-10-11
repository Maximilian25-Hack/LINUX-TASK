#!/usr/bin/env bash
# Secure File Management & User Configuration on Kali Linux
# Ordered command reference — not an unattended automation script.
#
# IMPORTANT:
# - Create the user as an administrative user.
# - Set the password interactively.
# - Switch to agent007 manually.
# - Perform file operations as agent007.
# - Leave agent007 before the root ownership exercise.
# - Do not place passwords in this file.

set -u

# ============================================================
# PHASE 1 — ADMINISTRATIVE USER CREATION
# ============================================================

# Required task command:
sudo useradd -m -s /bin/bash -G sudo agent007

# Set the password interactively:
sudo passwd agent007

# Verify account configuration:
getent passwd agent007
groups agent007

# ============================================================
# PHASE 2 — MANUAL USER SWITCH
# ============================================================

# Run manually in the terminal:
# su - agent007
#
# Then verify:
# whoami
# pwd

# ============================================================
# PHASE 3 — RUN AS agent007
# ============================================================

cd /home/agent007
mkdir mission
cd mission
mkdir intel
mkdir ops
cd ops
mkdir backup
cd /home/agent007/mission

# Create the required files:
cd /home/agent007/mission/intel
touch targets.txt routes.txt keys.txt

# Required redirected listings:
ls > listing1.txt
ls -l > listing2.txt
ls -la > listing3.txt

# Copy routes.txt to backup:
cp routes.txt /home/agent007/mission/ops/backup/

# Remove keys.txt:
rm keys.txt

# Set targets.txt to owner rw, group r, others none:
chmod 640 targets.txt

# Verify:
ls -l targets.txt

# ============================================================
# PHASE 4 — ERROR / RECOVERY TEST (agent007)
# ============================================================

# Intentionally remove the backup copy:
rm /home/agent007/mission/ops/backup/routes.txt

# Restore it from intel:
cp /home/agent007/mission/intel/routes.txt /home/agent007/mission/ops/backup/

# Verify:
ls -la /home/agent007/mission/ops/backup/

# ============================================================
# PHASE 5 — ROOT OWNERSHIP EXERCISE
# ============================================================

# Leave agent007 manually:
# exit

# As the administrative/root-capable account:
sudo chown root:root /home/agent007/mission/intel/targets.txt

# Observe ownership:
ls -l /home/agent007/mission/intel/targets.txt

# Switch back manually:
# su - agent007

# As agent007, observe again:
ls -l /home/agent007/mission/intel/targets.txt

# ============================================================
# PHASE 6 — EVIDENCE / SUBMISSION
# ============================================================

# Final required recursive listing:
ls -laR /home/agent007/mission/

# Optional text capture for submission:
ls -laR /home/agent007/mission/ > ~/final-output.txt

# Command-history copy:
history > ~/command-history.txt

# Copy the actual contents of ~/command-history.txt and
# ~/final-output.txt into the corresponding submission files.
