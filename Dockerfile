# syntax=docker/dockerfile:1
# NOTE Lint this file with https://hadolint.github.io/hadolint/

# SPDX-FileCopyrightText: 2024-2025 Robin Vobruba <hoijui.quaero@gmail.com>
#
# SPDX-License-Identifier: Unlicense

FROM bitnami/java:21-debian-12

WORKDIR /srv/rdf

RUN install_packages \
    ca-certificates \
    git \
    jq \
    pv \
    unzip \
    wget

COPY res ./res
COPY run ./run
RUN run/install

ENV DATA_DIR="/data"
ENV DB_BASE_DIR="/db"

RUN mkdir -p "$DATA_DIR"
RUN mkdir -p "$DB_BASE_DIR"

RUN run/fill-db --samples

# NOTE Labels and annotations are added by CI (outside this Dockerfile);
#      see `.github/workflows/docker.yml`.
#      This also means they will not be available in local builds.

ENTRYPOINT ["run/web-ui"]
CMD ["--port", "80"]
EXPOSE 80
