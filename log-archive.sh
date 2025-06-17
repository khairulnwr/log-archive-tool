#!/bin/bash

# Script: log-archive.sh
# Deskripsi: Mengarsipkan log dari direktori yang diberikan, simpan ke ~/log-archives

if [ -z "$1" ]; then
    echo "Penggunaan: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"

if [ ! -d "$LOG_DIR" ]; then
    echo "Direktori log tidak ditemukan: $LOG_DIR"
    exit 1
fi

ARCHIVE_DIR=~/log-archives
mkdir -p "$ARCHIVE_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_FILE="logs_archive_${TIMESTAMP}.tar.gz"
LOG_FILE="${ARCHIVE_DIR}/archive_log.txt"

tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" -C "$LOG_DIR" .

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Arsip dibuat: $ARCHIVE_FILE dari $LOG_DIR" >> "$LOG_FILE"
echo "✅ Log berhasil diarsip ke: $ARCHIVE_DIR/$ARCHIVE_FILE"

