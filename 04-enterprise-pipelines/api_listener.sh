#!/bin/bash
set -e

DATA_FILE="targets.json"
SECURITY_LOG="incident_response.log"

# 🪤 DAY 31 MEMORY CIRCUIT BREAKER
trap 'echo -e "\n[!] API ENGINE INTERRUPT DETECTED! Shutting down system listeners cleanly..."; echo "[+] System memory registers flushed. Safe exit status 0."; exit 0;' SIGINT

echo "🚀 Launching Production API Listener Matrix..."
echo "Monitoring structured data stream: ${DATA_FILE}"
echo "--------------------------------------------------------"

while true; do
    echo "[$(date)] API Engine Polling JSON Cluster States..."

    if [ ! -f "$DATA_FILE" ]; then
        echo "[-] ERROR: targets.json configuration file not found!"
        exit 1
    fi

    ARRAY_LENGTH=$(jq '.infrastructure_cluster | length' "$DATA_FILE")

    for ((i=0; i<$ARRAY_LENGTH; i++)); do
        NODE_NAME=$(jq -r ".infrastructure_cluster[$i].node_id" "$DATA_FILE")
        NODE_IP=$(jq -r ".infrastructure_cluster[$i].ip_address" "$DATA_FILE")

        echo "🔍 Interrogating Node Index [${i}]: ${NODE_NAME}"

        # 🚨 THE HARDENED DEVSECOPS SECURITY INTERROGATION GATE
        if [[ ! "$NODE_NAME" =~ ^[a-zA-Z0-9_]+$ ]]; then
            echo "   [!] ALERT: CRITICAL COMMAND INJECTION INTERCEPTED!"
            echo "   [!] Threat String: '${NODE_NAME}' from IP: ${NODE_IP}"
            echo "[$(date)] ⚠️ THREAT BLOCKED: Malicious Node ID '${NODE_NAME}' intercepted from source address ${NODE_IP}" >> "$SECURITY_LOG"
            echo "[-] PANIC SHUTDOWN: Stopping all automation lines to protect the kernel perimeter."
            exit 1 
        fi

        ./01-mass-scale-engines/lockdown.sh "${NODE_NAME}" "${NODE_IP}"
    done

    echo "--------------------------------------------------------"
    sleep 10
done
