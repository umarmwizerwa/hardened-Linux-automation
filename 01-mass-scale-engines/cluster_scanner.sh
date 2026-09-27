#!/bin/bash
set -e

echo "Initializing Optimized Enterprise Batch Cluster Scan..."
echo "----------------------------------------------------"

# 1. Define the Targeted Domain Matrix Array
for TARGET in google.com cloudflare.com yahoo.com; do

    echo "Scanning Node Pipeline -> Target: https://${TARGET}"
    
    # 2. Optimized HEAD-only Network Query
    HTTP_CODE=$(curl -sIL -o /dev/null -w "%{http_code}" "https://${TARGET}")
    
    # 3. Evaluate Dynamic Return Codes
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Node State -> [ONLINE] Status Code: ${HTTP_CODE}"
    else
        echo "NODE ANOMALY DETECTED -> Target returned code: ${HTTP_CODE}"
    fi
    echo "----------------------------------------------------"
done

echo "Batch processing sequence completed successfully."
