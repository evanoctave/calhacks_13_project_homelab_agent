PY := .venv/bin/python

.PHONY: check lint type test score

check: lint type test score

lint:
	$(PY) -m ruff check .

type:
	$(PY) -m mypy agent lab score.py

test:
	$(PY) -m pytest -q

score:
	$(PY) score.py
