#!/bin/sh -e

readonly GCP_PROJECT_ID=$1

gsutil mb -p "${GCP_PROJECT_ID}" -c multi_regional -l asia "gs://tf-state-load-testing-${GCP_PROJECT_ID}/"
