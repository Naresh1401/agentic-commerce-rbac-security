.PHONY: setup run test

setup:
	@if [ -f backend/requirements.txt ]; then pip install -r backend/requirements.txt; fi
	@if [ -f mcp-server/requirements.txt ]; then pip install -r mcp-server/requirements.txt; fi
	@if [ -f agents/requirements.txt ]; then pip install -r agents/requirements.txt || true; fi
	@if [ -f frontend/package.json ]; then cd frontend && npm install; fi

run:
	cd backend && python3.11 -m uvicorn app.main:app --reload --port 8000

test:
	python3.11 -m pytest testing/unit_tests tests

