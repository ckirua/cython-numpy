# Variables
PYTHON := python
PIP := pip

# Default target
.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make prod       - Build and install for production"
	@echo "  make dev        - Build and install for development"
	@echo "  make install    - Install dependencies"
	@echo "  make install-dev - Install in development mode"
	@echo "  make build      - Build in development mode"
	@echo "  make build-dev  - Build in development mode"
	@echo "  make test       - Run tests"
	@echo "  make clean      - Clean up temporary files"
	@echo "  make lint       - Run code linting"
	@echo "  make docs       - Build documentation"

.PHONY: prod
prod:
	make build
	make install
	
.PHONY: dev
dev:
	make build-dev
	make install-dev

.PHONY: install
install:
	$(PIP) install -r requirements.txt
	$(PIP) install .

.PHONY: install-dev
install-dev:
	$(PIP) install -r requirements.txt
	$(PIP) install -e .

.PHONY: build
build:
	$(PYTHON) setup.py build_ext

.PHONY: build-dev
build-dev:
	$(PYTHON) setup.py build_ext --inplace


.PHONY: test
test:
	$(PIP) install pytest
	$(PYTHON) -m pytest tests/

.PHONY: clean
clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name "src" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*.pyd" -delete
	find . -type f -name ".coverage" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type d -name "*.egg" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".coverage" -exec rm -rf {} +
	find . -type d -name "build" -exec rm -rf {} +
