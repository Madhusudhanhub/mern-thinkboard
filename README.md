# 🧠 MERN ThinkBoard

A modern note-taking app built using the **MERN** stack.  
It features full **CI/CD pipelines with Jenkins**, **Docker-based environments**, and real-time **monitoring with Prometheus and Grafana**.

---

## 📦 Tech Stack

| Layer       | Technology                                |
|-------------|--------------------------------------------|
| Frontend    | React (Vite) + Tailwind CSS               |
| Backend     | Node.js + Express + MongoDB               |
| CI/CD       | Jenkins + Docker + GitHub                 |
| Monitoring  | Prometheus, Grafana, Node Exporter, cAdvisor |

---

## 🚀 CI/CD Pipelines

This project uses a multibranch Jenkins pipeline with different behavior based on the Git branch.

### 🔧 `dev` Branch

- Builds Docker images:
  - `madhusudhan143/mern-thinkboard-dev-backend`
  - `madhusudhan143/mern-thinkboard-dev-frontend`
- Pushes to **public Docker Hub**
- Deploys to a **development environment** on EC2

### 🔐 `main` Branch

- Builds Docker images:
  - `madhusudhan143/mern-thinkboard-prod-backend`
  - `madhusudhan143/mern-thinkboard-prod-frontend`
- Pushes to **private Docker Hub**
- Deploys to **production environment** on EC2

> ✅ The `Jenkinsfile` handles both dev/prod logic by checking the branch name.

---

## 🐳 Dockerized Setup

All services are Dockerized using `docker-compose`.

```bash
# From project root
docker-compose up -d

Services included:
✅ React frontend (served via NGINX)

✅ Express backend

✅ (Optional) MongoDB container

✅ Monitoring stack (inside monitoring/)

📈 Monitoring with Prometheus + Grafana
Located inside the monitoring/ folder, this setup includes:

Prometheus for metrics scraping

Node Exporter for EC2-level monitoring

cAdvisor for container-level monitoring

Grafana for beautiful dashboards

cd monitoring
docker-compose up -d

Directory Structure

mern-thinkboard/
├── backend/           # Express backend code
├── frontend/          # React frontend (Vite)
├── monitoring/        # Prometheus + Grafana setup
│   ├── docker-compose.yml
│   └── prometheus.yml
├── Jenkinsfile        # CI/CD logic for both dev and main
└── README.md

| Branch | Backend Image                               | Frontend Image                               |
| ------ | ------------------------------------------- | -------------------------------------------- |
| dev    | madhusudhan143/mern-thinkboard-dev-backend  | madhusudhan143/mern-thinkboard-dev-frontend  |
| main   | madhusudhan143/mern-thinkboard-prod-backend | madhusudhan143/mern-thinkboard-prod-frontend |


echo "Test Trigger" >> test.txt
git add test.txt
git commit -m "Webhook test"
git push origin dev

👤 Author
Madhu Sudhan
🔗 GitHub

