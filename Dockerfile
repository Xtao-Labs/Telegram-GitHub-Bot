FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

RUN ./download_wkhtmltox buster_amd64

RUN dpkg -i wkhtmltox_*.deb

RUN python3 -m pip config set global.index-url https://mirrors.aliyun.com/pypi/simple

RUN python3 -m pip install poetry && poetry config virtualenvs.create false

COPY ./pyproject.toml ./poetry.lock* /app/

RUN poetry install --no-root --no-dev

RUN poetry run playwright install
