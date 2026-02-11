FROM python:3.13-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv
WORKDIR /app
COPY pyproject.toml .
RUN uv sync
COPY . .
CMD ["uv", "run", "manage.py", "runserver", "0.0.0.0:8000"]
