FROM python:3-slim AS builder

RUN pip install -U pdm
ENV PDM_CHECK_UPDATE=false

COPY pyproject.toml pdm.lock /project/

WORKDIR /project
RUN pdm install --check --prod --no-editable

FROM python:3-slim

COPY --from=builder /project/.venv/ /project/.venv
COPY main.py /project/

ENV PATH="/project/.venv/bin:$PATH"
ENTRYPOINT ["python", "/project/main.py"]
