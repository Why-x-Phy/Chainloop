PYTHON ?= python3
VENV_DIR ?= .venv
API_DIR := api
API_REQ := $(API_DIR)/requirements.txt
PIP := $(VENV_DIR)/bin/pip
PYTEST := $(VENV_DIR)/bin/pytest
UVICORN := $(VENV_DIR)/bin/uvicorn

.PHONY: help doctor bootstrap venv install test run-api run-worker clean

help:
	@echo "Available targets:"
	@echo "  make doctor     - Check local tooling (python, pip, docker)"
	@echo "  make bootstrap  - Create venv, install deps, create .env"
	@echo "  make test       - Run API tests"
	@echo "  make run-api    - Run FastAPI app locally (no docker)"
	@echo "  make run-worker - Run ingestion worker locally (no docker)"
	@echo "  make clean      - Remove local artifacts"

doctor:
	@bash scripts/doctor.sh

bootstrap: venv install
	@if [ ! -f .env ]; then cp config.example.env .env; echo "Created .env from config.example.env"; else echo ".env already exists"; fi
	@echo "Bootstrap done. Next: source $(VENV_DIR)/bin/activate && make test"

venv:
	@$(PYTHON) -m venv $(VENV_DIR)
	@echo "Virtualenv ready at $(VENV_DIR)"

install:
	@$(PIP) install --upgrade pip
	@$(PIP) install -r $(API_REQ)

test:
	@cd $(API_DIR) && PYTHONPATH=. $(PYTEST) -q tests/*_checks.py

run-api:
	@cd $(API_DIR) && PYTHONPATH=. $(UVICORN) app.main:app --host 0.0.0.0 --port 8000 --reload

run-worker:
	@cd worker && ../$(VENV_DIR)/bin/python worker.py

clean:
	@rm -rf $(VENV_DIR)
	@find api -type d -name '__pycache__' -prune -exec rm -rf {} +
	@rm -f api/btc_app.db
