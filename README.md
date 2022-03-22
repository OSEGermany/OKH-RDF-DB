<!--
SPDX-FileCopyrightText: 2021 Robin Vobruba <hoijui.quaero@gmail.com>

SPDX-License-Identifier: CC0-1.0
-->

[![GitHub license](
    https://img.shields.io/github/license/OPEN-NEXT/LOSH-RDF-DB-tester.svg?style=flat)](
    ./LICENSE.txt)
[![REUSE status](
    https://api.reuse.software/badge/github.com/OPEN-NEXT/LOSH-RDF-DB-tester)](
    https://api.reuse.software/info/github.com/OPEN-NEXT/LOSH-RDF-DB-tester)

# LOSH RDF tripple-store tester

This contains instructions and scripts
to help you easily test the LOSH-OKH data
with the [Apache Jena](https://jena.apache.org/) triple-store.

In short, it:

1. Downloads the required software (to `~/.local/opt/apache-jena-*`)
2. Creates a directory to use as the Database/tripple-store/backend
3. Loads the LOSH OKH ontology and all the crawled modules into the database
4. Starts a local Web-interface for you to run SPARQL queries on the data.

## Usage

```bash
# Creates the DB and fills it with the data
# (See the script output for instructions
# of how to run SPARQL querries on the command-line)
./fill-db

# Starts the Web-interface
# (see script output for the URL
# you will have to open in your browser)
./web-ui
```

[sample-query.txt](sample-query.txt) contains a sample query.

