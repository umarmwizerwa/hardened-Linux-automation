cat << 'EOF' > secure_gate.sh
#!/bin/bash
set -e

INPUT_USER="$1"

# 1. Defensive Gate 1: Enforce Parameter Presence
if [ -z "$INPUT_USER" ]; then
    echo "[-] CRITICAL INPUT FAILURE: No username argument provided!"
    echo "Usage: ./secure_gate.sh <username>"
    exit 1
fi

# 2. Defensive Gate 2: Enforce Strict Alphanumeric Sanitization (Regex Sieve)
if [[ ! "$INPUT_USER" =~ ^[a-zA-Z0-9_]+$ ]]; then
    echo "[-] SECURITY THREAT INTERCEPTED: Illegal characters detected in input!"
    echo "Provided string: '${INPUT_USER}'"
    echo "Execution blocked: Input must contain ONLY letters, numbers, and underscores."
    exit 1
fi

# 3. Secure Execution Path
echo "[+] Input parameter authenticated successfully."
echo "[+] Initializing isolated cloud configuration profiles for user: ${INPUT_USER}"
EOF
