.PHONY: sync format lint typecheck test check-all clean

# Default target when running just `make`
.DEFAULT_GOAL := check-all

# Sync virtual environment and lockfile with uv
sync:
	uv sync

# Format codebase automatically using ruff
format:
	uv run ruff format .

# Run ruff linter with automatic fixes
lint:
	uv run ruff check --fix .

# Run strict mypy static type analysis
typecheck:
	uv run mypy src/

# Run all tests across the src/ directory
test:         
	uv run pytest src/

# Run full code quality pipeline
check-all: format lint typecheck test

# Clean up cache files and build artifacts
clean:
	rm -rf .venv .mypy_cache .ruff_cache .pytest_cache *.egg-info build dist