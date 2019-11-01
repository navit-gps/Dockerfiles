# ################################################################### #
# This image in the "sanity_check" phase of the CI build.
# It is pre-baked to make the build faster and avoid loosing CI time. #
# ################################################################### #
FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y git astyle libxml2-utils file openjdk-11-jre \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
