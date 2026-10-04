#!/bin/bash
set -e

# 1. In-Memory Structured Database Payload
DATA_PAYLOAD='{
  "cluster": [
    {"node_id": "db_01", "ip": "10.0.0.5"},
    {"node_id": "malicious; rm -rf", "ip": "192.168.1.1"}
  ]
}'

# 2. Architect-Grade Functions (Encapsulated Scope)
log_incident() {
    local message="$1"
    echo "[$(date)] ⚠️ SECURITY LOG: ${message}" >> "security_incidents.log"
}

interrogate_input() {
    local target_name="$1"
    
    # Day 32 Input Gate Metal Detector Check
    if [[ ! "$target_name" =~ ^[a-zA-Z0-9_]+$ ]]; then
        log_incident "Malicious payload attempt blocked: '${target_name}'"
        return 1
    fi
    return 0
}

# 3. Main Loop Executor Matrix (The lines from your screenshot!)
echo "🚀 Launching 1% Modular System Sentinel..."
echo "--------------------------------------------------------"

ARRAY_LENGTH=$(echo "$DATA_PAYLOAD" | jq '.cluster | length')

for ((i=0; i<$ARRAY_LENGTH; i++)); do
    NODE_NAME=$(echo "$DATA_PAYLOAD" | jq -r ".cluster[$i].node_id")
    NODE_IP=$(echo "$DATA_PAYLOAD" | jq -r ".cluster[$i].ip")

    echo "🔍 Scanning Node Index [${i}]: ${NODE_NAME}"

    if interrogate_input "$NODE_NAME"; then
        echo "   [+] STATUS: Clean. Passing token to routing rails for IP: ${NODE_IP}"
    else
        echo "   [!] ALARM: Function returned Code 1. Input Gate slammed shut!"
    fi
    echo "--------------------------------------------------------"
done
