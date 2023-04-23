
[![Build and publish Docker image](https://github.com/mdernovoi/mlflow/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/mdernovoi/mlflow/actions/workflows/docker-image.yml)

# MLflow Docker container

**[Docker Hub image](https://hub.docker.com/r/mdernovoi/mlflow)**

This is a simple container for [MLflow](https://mlflow.org/). It is based on the [official MLflow container](https://mlflow.org/docs/latest/docker.html) and adds extended package management and functionality:

- Additional Python packages through the `requirements.txt`.
- Packages to connect to PostgreSQL to store tracking data.
- Packages to connect to S3 storage to store tracking artifacts.

> MLflow is a platform to streamline machine learning development, including tracking experiments, packaging code into reproducible runs, and sharing and deploying models. MLflow offers a set of lightweight APIs that can be used with any existing machine learning application or library (TensorFlow, PyTorch, XGBoost, etc.), wherever you currently run ML code (e.g., in notebooks, standalone applications, or the cloud). [&copy; MLflow](https://github.com/mlflow/mlflow/blob/master/README.rst)

## Usage

### Run MLflow

```Shell
docker run --rm \
       -p 5000:5000 \
       --env MLFLOW_HOST=0.0.0.0 \
       --env MLFLOW_PORT=5000 \
       --env-file MLFLOW_CONNECTION_SECRETS.env \
       mdernovoi/mlflow
```
- MLflow listens on all addresses (`0.0.0.0`).
- MLflow is published on the host machine on port `5000`.
- The `MLFLOW_CONNECTION_SECRETS.env` environment file contains configuration secrets for storage access (database passwords, etc.). An example is provided in the repository.


## Improvements and Suggestions

Please suggest any improvements or express wishes in the Issues section. A pull request with a corresponding implementation or fix is not required but would be appreciated.

