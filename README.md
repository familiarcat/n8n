# 🍕 Pie Guy n8n Deployment

This project contains a fully functional CI/CD pipeline and automation system for Pie Guy Pizza Parlor & Bar, powered by `n8n`, Docker, and GitHub Actions.

---

## 🔧 Project Structure

```
n8n/
├── .github/workflows/deploy.yml        # GitHub Actions deployment workflow
├── docker-compose.yml                  # HTTPS-ready n8n Docker setup
├── workflows/pg_master_flow.json       # Main automation workflow (Slack → Sheets)
├── mock_data/                          # Staff, schedules, and inventory samples
├── scripts/
│   ├── deploy_n8n_ec2.sh               # Shell script to deploy to EC2 via Docker
│   └── import_workflow.sh              # Optional workflow importer (now automated)
```

---

## 🚀 Deployment Guide

### 1. 🌐 Requirements
- An EC2 instance (Ubuntu 22+)
- Domain name: `n8n.pbradygeorgen.com`
- NGINX + Certbot configured to reverse proxy port 5678 to HTTPS

### 2. 🔐 GitHub Repository Setup
Create the following GitHub Secrets in your repo:

| Name             | Value Description                          |
|------------------|--------------------------------------------|
| `EC2_PUBLIC_IP`  | Public IP of your EC2 instance             |
| `EC2_SSH_KEY`    | Paste contents of your `~/.ssh/xxx.pem`    |

### 3. 📦 Push to `main` Branch
GitHub Actions will:
1. SSH into EC2 and deploy n8n via `docker-compose`
2. Automatically POST `pg_master_flow.json` to `https://n8n.pbradygeorgen.com/rest/workflows`
3. Your workflow will be visible immediately in the n8n UI

### 4. 🧪 Verification
- Visit: [https://n8n.pbradygeorgen.com](https://n8n.pbradygeorgen.com)
- Login with:
  - **User**: `admin`
  - **Password**: `password123`
- Confirm that "pg_master_flow" appears under Workflows

---

## 📈 Workflow Features

- Slack-based time-off approval
- Google Sheets logging
- Bilingual feedback logic (coming soon)
- Full integration with staff roles, schedules, and inventory logic

---

## 🧠 Authors & AI Crew
- General Manager: Brady Georgen
- Crew: Cmdr. Troi, Mr. Data, Spock, Geordi, Scotty (via n8n JSON & workflows)
