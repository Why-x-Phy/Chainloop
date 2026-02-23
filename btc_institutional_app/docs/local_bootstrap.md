# Local Bootstrap Guide (with/without Docker)

This project supports two development paths:

1. **Docker path** (recommended on VPS/production-like setup)
2. **Local Python path** (works even if Docker CLI is unavailable)

## 1) Quick doctor check

From `btc_institutional_app/`:

```bash
make doctor
```

This checks Python and Docker availability.

## 2) Local Python bootstrap (no Docker required)

```bash
make bootstrap
make test
```

Then run API locally:

```bash
make run-api
```

The API will be available at `http://127.0.0.1:8000/v1/health`.

## 3) Docker bootstrap

If Docker is installed:

```bash
cp config.example.env .env
docker compose up --build -d
```

Then open:

- `http://<VPS-IP>/` (dashboard behind Basic Auth)
- `http://<VPS-IP>/api/v1/health`

## 4) Install Docker on Ubuntu (reference)

```bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

(Optional) run docker without sudo:

```bash
sudo usermod -aG docker $USER
newgrp docker
```

## 5) Notes

- `EXECUTION_ENABLED` remains `false` by default.
- For production, use TLS profile and rotate secrets as documented in `docs/secret_rotation_playbook.md`.
