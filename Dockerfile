FROM python:3.10-slim-bullseye AS build

WORKDIR /tmp

COPY ./pyproject.toml ./poetry.lock* /tmp/

RUN pip install poetry \
    && poetry config virtualenvs.create false \
    && poetry export -f requirements.txt --output requirements.txt --without-hashes --with dev

FROM python:3.10-slim-bullseye

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONPATH="${PYTHONPATH}:/app"

WORKDIR /app

COPY --from=build /tmp/requirements.txt .

RUN apt-get update \
    && apt-get -y install gcc

RUN pip install --no-cache-dir --upgrade -r requirements.txt \
    && rm requirements.txt

COPY faust_learning faust_learning
COPY scripts scripts

ENTRYPOINT ["bash", "./scripts/entrypoint.sh"]
