# Hardened Linux Automation Engine 🛡️

A production-grade DevSecOps infrastructure repository tracking automated loop processing systems, memory circuit breakers, and defensive parameter validation gates. Developed entirely down a rigorous, self-guided systems architecture curriculum.

---

## 🗂️ Core Infrastructure Modules

### 🔁 01. Mass-Scale Looping Engines (Day 30)
* **Cluster Scanner (`cluster_scanner.sh`):** An optimized, non-blocking telemetry engine that leverages combined silent flags and HTTP `HEAD` requests (`curl -sIL`) to poll infrastructure states without body-payload overhead.
* **Worker Matrix (`lockdown.sh`):** A specialized execution script designed to implement security tasks on a single node payload passed from a parent orchestrator.

### 🪤 02. Advanced Signal Interception & Traps (Day 31)
* **Self-Cleaning Sentinel (`clean_sentinel.sh`):** Employs memory-locked `trap` structures to intercept kernel-level `SIGINT` (Ctrl+C) and `SIGTERM` signals. Guarantees atomic deletion of temporary `/tmp/` tracking footprints during unexpected pipeline drops to halt storage leaks.

### 🧮 03. Defensive Input Sanitization Gates (Day 32)
* **Secure Input Interrogator (`secure_gate.sh`):** A zero-trust data gate backed by a strict regular expression filter (`[[ ! "$VAR" =~ ^[a-zA-Z0-9_]+$ ]]`). Sweeps parameters character-by-character to throw out system symbols, command injections, and malformed spacing threats before they hit the kernel layer.

### 📊 04. Structured Data Pipelines & Listeners (Day 33)
* **Complex API Listener Loop (`api_listener.sh`):** A continuous monitoring engine that uses `jq` to parse structural keys out of a `targets.json` file. Integrates regular expression interrogation gates and automated worker triggering matrices under an absolute, defensive forensic alert and panic-shutdown framework.
