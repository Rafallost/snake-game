#!/bin/sh
echo "Running smoke test..."
/app/snake --help | grep -q "Usage" && echo "OK" || echo "FAIL"