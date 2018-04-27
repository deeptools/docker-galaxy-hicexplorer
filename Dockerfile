# Galaxy - HiCExplorer

FROM quay.io/bgruening/galaxy-ngs-preprocessing:18.01

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND HiCExplorer

# Install tools
ADD hicexplorer*.yml $GALAXY_ROOT/
RUN install-tools $GALAXY_ROOT/hicexplorer.yml

RUN install-tools $GALAXY_ROOT/hicexplorer2.yml

RUN install-tools $GALAXY_ROOT/hicexplorer3.yml && \
    mkdir -p $GALAXY_HOME/workflows

# Add workflows to the Docker image
ADD ./workflows/* $GALAXY_HOME/workflows/

ENV GALAXY_CONFIG_TOOL_PATH=/galaxy-central/tools/

ADD https://raw.githubusercontent.com/galaxyproject/training-material/master/topics/epigenetics/tutorials/hicexplorer/tours/tour.yaml $GALAXY_ROOT/config/plugins/tours/hicexplorer.yaml

# Download training data and populate the data library
#RUN startup_lite && \
#    galaxy-wait && \
#    workflow-install --workflow_path $GALAXY_HOME/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD


# Container Style
ADD assets/img/full_logo.png $GALAXY_CONFIG_DIR/web/welcome_image.png
ADD welcome.html $GALAXY_CONFIG_DIR/web/welcome.html
