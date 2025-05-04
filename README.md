# JMeter Testing with Docker, InfluxDB, and Grafana

This project allows you to run a JMeter test plan **without installing JMeter GUI**, and visualize the results in **Grafana** using **InfluxDB**.

---

## 🚀 How to Use

### 🧩 1. Clone the Repository

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### 🐳 2. Start Docker Engine

Make sure Docker Desktop (or Docker Engine) is running on your system.

---

### ⚙️ 3. Run the Test Plan

Open **Command Prompt** or **PowerShell**, then:

1. Navigate to the folder where you cloned the repository
2. Run the test:

#### 📦 Example commands:
- **Command Prompt:**
  ```cmd
  run-test.bat
  ```
- **PowerShell:**
  ```powershell
  .\run-test.bat
  ```

You can also pass optional arguments:

```bash
run-test.bat [THREADS] [RAMPUP]
```

- `THREADS`: Number of virtual users (default: `1000`)
- `RAMPUP`: Time in seconds to ramp up users (default: `1`)

✅ Example:
```cmd
run-test.bat 500 2
```

This script:
- Starts Docker containers via `docker-compose`
- Runs the test defined in `Test Plan.jmx`
- Logs output to `jmeter.log`
- Does **not require JMeter GUI**

---

### 📊 4. View Results in Grafana

1. Open your browser and go to:  
   👉 `http://localhost:3000`

2. Log in with default credentials:
   - **Username:** `admin`
   - **Password:** `admin`

3. Dismiss all pop-ups and skip password change

---

### 🔌 5. Connect to InfluxDB

1. Go to: `Connections` → `Data Sources`
2. Click **"Add new connection"**
3. Search for **InfluxDB**, then click **"Add new data source"**
4. Set the following fields:

```
URL:       http://influxdb:8086
Database:  mybucket
User:      admin
Password:  my-super-secret-auth-token
```

5. Click **"Save and test"**

---

### 📈 6. Import the JMeter Dashboard

1. Go to: `Dashboards` → `New` → `Import`
2. Enter **`4026`** and click **Load**
3. Under **"DB name"**, choose **InfluxDB**
4. Click **Import**

✅ You should now see a Grafana dashboard with **JMeter test results summary**

---

## 📁 Logs

- Test logs are saved in: `jmeter.log`

This file is created in the same folder where the script runs.

---

## 🧼 Clean Up

To stop and remove Docker containers:

```bash
docker-compose down --volumes --rmi all
```

---
