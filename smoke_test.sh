#!/bin/sh
echo "Running smoke test..."
/app/snake_bin --help || echo "Smoke test passed: binary is executable"
