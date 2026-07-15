# Simple Django Login and Registration

[![CI Pipeline](https://img.shields.io/badge/CI-GitHub_Actions-blue?logo=githubactions)]()
[![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker)]()
[![Python](https://img.shields.io/badge/Python-3.10%20%7C%203.11%20%7C%203.12-blue?logo=python)]()
[![Django](https://img.shields.io/badge/Django-Production_Ready-092E20?logo=django)]()

An enhanced version of the original **Simple Django Login and Registration** project featuring user authentication, email activation, password management, and a complete **CI/CD and Docker-based deployment pipeline**.

---

##  Original Features

- User registration
- Login via username and password
- Login via email and password
- Login via username or email
- Remember me functionality
- Email account activation
- Password reset
- Username reminder
- Resend activation email
- Change password
- Change email
- Edit profile
- Multilingual support

---

#  My Contributions

This fork transforms the original project from a local development application into a **production-ready, containerized application with an automated CI/CD pipeline**.

---

##  Docker Containerization

Implemented complete Docker support:

- Added a production-ready `Dockerfile`
- Added `.dockerignore`
- Configured the application to run with **Gunicorn**
- Built and tested Docker images locally
- Containerized the Django application for consistent deployments

### Build Docker Image

```bash
docker build -t django-auth-app .
```

### Run Docker Container

```bash
docker run -d -p 8000:8000 --name django-auth django-auth-app
```

Application:

```text
http://localhost:8000
```

Admin Panel:

```text
http://localhost:8000/admin
```

---

#  CI/CD Pipeline with GitHub Actions

Implemented a multi-stage CI/CD workflow using **GitHub Actions**.

## Workflow Stages

### 1️ Linting Stage

- Black
- Flake8

Ensures code quality and formatting standards.

---

### 2️ Continuous Integration (CI)

Runs automatically on:

- Push
- Pull Request

Tests application compatibility on:

- Python 3.10
- Python 3.11
- Python 3.12

Pipeline tasks:

```bash
python source/manage.py migrate
python source/manage.py test
```

---

### 3️ Continuous Deployment (CD)

If all previous stages pass successfully:

- Builds Docker image
- Pushes image to Docker Hub
- Publishes:

```text
latest
```

and

```text
<git-commit-sha>
```

tags.

---

#  Secrets Management

Configured secure credential storage using GitHub Secrets:

| Secret | Purpose |
|---------|----------|
| `DOCKER_USERNAME` | Docker Hub Username |
| `DOCKER_PASSWORD` | Docker Hub Access Token |

Repository Settings:

```text
Settings
→ Secrets and variables
→ Actions
```

---

#  CI/CD Workflow Architecture

```text
Developer Push
       │
       ▼
┌──────────────────┐
│   Linter Stage   │
│ Black & Flake8   │
└──────────────────┘
       │
       ▼
┌──────────────────┐
│  Test Matrix CI  │
│ Python 3.10      │
│ Python 3.11      │
│ Python 3.12      │
└──────────────────┘
       │
       ▼
┌──────────────────┐
│ Docker Build     │
│ & Push           │
└──────────────────┘
       │
       ▼
      Docker Hub
```

---

#  Project Structure

```text
simple-django-login-and-register/
│
├── .github/
│   └── workflows/
│       └── django-pipeline.yml
│
├── source/
│   ├── accounts/
│   ├── app/
│   └── manage.py
│
├── Dockerfile
├── .dockerignore
├── requirements.txt
├── requirements-dev.txt
└── README.md
```

---

#  Local Development Setup

## Clone Repository

```bash
git clone https://github.com/<your-username>/simple-django-login-and-register.git
cd simple-django-login-and-register
```

## Create Virtual Environment

### Linux / macOS

```bash
python -m venv .venv
source .venv/bin/activate
```

### Windows

```cmd
.venv\Scripts\activate
```

## Install Dependencies

```bash
pip install -r requirements-dev.txt
```

## Run Migrations

```bash
python source/manage.py migrate
```

## Create Superuser

```bash
python source/manage.py createsuperuser
```

## Start Development Server

```bash
python source/manage.py runserver
```

---

#  Run Tests

```bash
python source/manage.py test
```

---

#  Technologies Used

- Python
- Django
- Docker
- Gunicorn
- GitHub Actions
- Docker Hub
- SQLite
- Git
- CI/CD
- DevOps Practices

---

#  Learning Outcomes

Through this project, I gained practical experience with:

- Django application deployment
- Docker containerization
- GitHub Actions workflows
- Continuous Integration and Continuous Deployment (CI/CD)
- Environment variables and secrets management
- Automated Docker image publishing
- Production-ready application workflows
- Multi-version Python testing using matrix strategies

---

#  Outcome

Implemented an end-to-end automated workflow:

```text
Code Push
   ↓
Linting
   ↓
Automated Testing
   ↓
Docker Image Build
   ↓
Docker Hub Deployment
```

This project demonstrates hands-on experience in **Django development, DevOps, Docker, CI/CD automation, and production-ready software deployment practices**.
