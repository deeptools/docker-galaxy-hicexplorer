# Galaxy - HiCExplorer

FROM quay.io/bgruening/galaxy-ngs-preprocessing:17.09

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND HiCExplorer
# Install tools
ADD hicexplorer.yml $GALAXY_ROOT/tools.yaml
RUN install-tools $GALAXY_ROOT/tools.yaml && \
    mkdir -p $GALAXY_HOME/workflows

# Add workflows to the Docker image
ADD ./workflows/* $GALAXY_HOME/workflows/

ENV GALAXY_CONFIG_TOOL_PATH=/galaxy-central/tools/

COPY data_library.yaml $GALAXY_ROOT/library_data.yaml

# Download training data and populate the data library
RUN startup_lite && \
    galaxy-wait && \
    workflow-install --workflow_path $GALAXY_HOME/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD && \
    setup-data-libraries -i $GALAXY_ROOT/library_data.yaml -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD
