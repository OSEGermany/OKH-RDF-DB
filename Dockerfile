# syntax=docker/dockerfile:1
# NOTE Lint this file with https://hadolint.github.io/hadolint/

# SPDX-FileCopyrightText: 2024-2025 Robin Vobruba <hoijui.quaero@gmail.com>
#
# SPDX-License-Identifier: Unlicense

FROM bitnami/java:21-debian-12

RUN mkdir -p /srv/rdf
WORKDIR /srv/rdf

RUN install_packages \
    ca-certificates \
    git \
    unzip \
    wget

COPY res ./res
COPY run ./run
RUN run/install
RUN run/fill-db

# NOTE Labels and annotations are added by CI (outside this Dockerfile);
#      see `.github/workflows/docker.yml`.
#      This also means they will not be available in local builds.

ENTRYPOINT ["run/web-ui"]
CMD ["--port", "80"]
EXPOSE 80
