
ARG MLFLOW_VERSION=2.3.0

FROM ghcr.io/mlflow/mlflow:v${MLFLOW_VERSION}

# dirty hack: https://stackoverflow.com/a/56748289
# ARGS are reset after every FROM statement
ARG MLFLOW_VERSION

RUN apt-get update &&  apt-get install -y --no-install-recommends \
 libpq-dev \
 python3-dev \
 git \
 wget \
 unzip

# for postgres database connection
# TODO: replace with the normal psycopg package which needs to be built from source.
# TODO: maybe migrate to psycopg3
RUN pip install psycopg2-binary --user

# install custom python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# run mlflow server with ui
CMD ["mlflow", "server"]