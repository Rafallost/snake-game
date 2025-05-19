#!/bin/sh
echo "[SMOKE TEST] Running check..." > /app/smoke.log
/app/snake_bin >> /app/smoke.log 2>&1
echo "[SMOKE TEST] Done." >> /app/smoke.log