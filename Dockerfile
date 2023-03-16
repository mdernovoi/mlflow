
ARG MLFLOW_VERSION=2.2.2

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
RUN pip install psycopg2-binary --user

RUN mkdir mlflow-tmp && cd mlflow-tmp

# get mlflow source
RUN wget https://github.com/mlflow/mlflow/archive/refs/tags/v${MLFLOW_VERSION}.zip --output-document=mlflow-git.zip
RUN unzip mlflow-git.zip -d mlflow-git

# install additional mlflow python dependencies
# ref: https://github.com/mlflow/mlflow/blob/master/EXTRA_DEPENDENCIES.rst
RUN pip install -r mlflow-git/mlflow-${MLFLOW_VERSION}/requirements/extra-ml-requirements.txt

# install my python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# clean up
RUN cd ../ && rm -r mlflow-tmp

# run mlflow server with ui
CMD ["mlflow", "server"]