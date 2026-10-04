.PHONY: sync format lint typecheck test check-all clean

# Default target when running just `make`
.DEFAULT_GOAL := check-all

sync:          ## Sync virtual environment and lockfile with uv
	uv sync

format:        ## Format codebase automatically using ruff
	uv run ruff format .

lint:          ## Run ruff linter with automatic fixes
	uv run ruff check --fix .

typecheck:     ## Run strict mypy static type analysis
	uv run mypy src/

test:          ## Run all tests across the src/ directory
	uv run pytest src/

check-all: format lint typecheck test ## Run full code quality pipeline

clean:         ## Clean up cache files and build artifacts
	rm -rf .venv .mypy_cache .ruff_cache .pytest_cache *.egg-info build dist