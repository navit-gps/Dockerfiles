# ################################################################### #
# This image in the "sanity_check" phase of the CI build.
# It is pre-baked to make the build faster and avoid loosing CI time. #
# ################################################################### #
FROM ubuntu:latest

# git and astyle are needed to do the check of the C & C++ files
# file is needed for the check of trailing spaces
# openjdk-11-jre is needed to have a java to run the gradle chechstyle for Java files
# curl are needed here to pre-download the gradle distribution
RUN apt-get update \
    && apt-get install -y git astyle libxml2-utils file openjdk-11-jre curl \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV GRADLE_ZIP_DIR=/root/.gradle/wrapper/dists/gradle-5.6-all/4chhpeaqtrfx4ih6mafwwr40u
RUN mkdir -p ${GRADLE_ZIP_DIR} \
    && curl --location --silent --show-error https://services.gradle.org/distributions/gradle-5.6-all.zip --output ${GRADLE_ZIP_DIR}/gradle-5.6-all.zip
