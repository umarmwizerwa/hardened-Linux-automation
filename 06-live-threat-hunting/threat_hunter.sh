cat << 'EOF' > threat_hunter.sh
#!/bin/bash
set -e

# 1. Define Security Log Source Paths & Storage Registers
AUTH_LOG="/var/log/auth.log"
REPORT_CSV="intrusion_report.csv"

# 2. Defensive Structural Gate Check: Verify Administrative Rights
if [ "$EUID" -ne 0 ]; then
    echo "[-] SECURITY ERROR: Threat hunting requires administrative privileges!"
    echo "Usage: sudo ./threat_hunter.sh"
    exit 1
fi

echo "=========================================================="
echo "LAUNCHING LIVE LIVE SECURITY TELEMETRY PARSER ENGINE..."
echo "=========================================================="

# 3. Initialize Structured CSV Audit File Ledger Headers
echo "Timestamp,Attacker_IP,Target_User" > "$REPORT_CSV"

# 4. Ingest, Segment, and Stream Active Intrusion Data
# We grep for failures and read the logs line-by-line using a loop matrix
grep -i "Failed password" "$AUTH_LOG" | while read -r line; do
    
    # Extract structural telemetry tokens via string word searches
    TIMESTAMP=$(echo "$line" | awk '{print $1" "$2" "$3}')
    ATTACKER_IP=$(echo "$line" | awk '{for(i=1;i<=NF;i++) if($i=="from") print $(i+1)}')
    TARGET_USER=$(echo "$line" | awk '{for(i=1;i<=NF;i++) if($i=="user" || $i=="for") {print $(i+1); break}}')
    
    # If parameters extract empty, bridge them with standard profiles
    if [ -z "$TARGET_USER" -o "$TARGET_USER" == "invalid" ]; then
        TARGET_USER="unknown_account"
    fi

    # PATH A: Output Live Flashing Banners to the Console Prompt Screen
    echo -e "\e[1;31m[!] ALERT:\e[0m Brute-force match caught at ${TIMESTAMP} | Src IP: ${ATTACKER_IP} | Target Profile: ${TARGET_USER}"
    
    # PATH B: Append Structured CSV Records to Disk for Firewall Ingestion
    echo "${TIMESTAMP},${ATTACKER_IP},${TARGET_USER}" >> "$REPORT_CSV"
done

echo "=========================================================="
echo "[+] Telemetry processing complete."
echo "[+] Permanent security audit ledger locked at: ${REPORT_CSV}"
echo "=========================================================="
EOF
