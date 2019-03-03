# Galaxy - HiCExplorer

FROM bgruening/galaxy-ngs-preprocessing:19.01

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND HiCExplorer

# Install tools
ADD hicexplorer*.yml $GALAXY_ROOT/

RUN install-tools $GALAXY_ROOT/hicexplorer.yml && \
    find /shed_tools/toolshed.g2.bx.psu.edu/ -name "test-data" -type d -prune -exec rm -r "{}" \; && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null
RUN install-tools $GALAXY_ROOT/hicexplorer2.yml && \
    find /shed_tools/toolshed.g2.bx.psu.edu/ -name "test-data" -type d -prune -exec rm -r "{}" \; && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null
RUN install-tools $GALAXY_ROOT/hicexplorer3.yml && \
    find /shed_tools/toolshed.g2.bx.psu.edu/ -name "test-data" -type d -prune -exec rm -r "{}" \; && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null
RUN install-tools $GALAXY_ROOT/hicexplorer4.yml && \
    find /shed_tools/toolshed.g2.bx.psu.edu/ -name "test-data" -type d -prune -exec rm -r "{}" \; && \
    /tool_deps/_conda/bin/conda clean --tarballs --yes > /dev/null && \
    mkdir -p $GALAXY_HOME/workflows

# Add workflows to the Docker image
ADD ./workflows/* $GALAXY_HOME/workflows/

ENV GALAXY_CONFIG_TOOL_PATH=/galaxy-central/tools/

ADD https://raw.githubusercontent.com/galaxyproject/training-material/master/topics/epigenetics/tutorials/hicexplorer/tours/tour.yaml $GALAXY_ROOT/config/plugins/tours/hicexplorer.yaml

# Download training data and populate the data library
RUN startup_lite && \
    galaxy-wait && \
    workflow-install --workflow_path $GALAXY_HOME/workflows/ -g http://localhost:8080 -u $GALAXY_DEFAULT_ADMIN_USER -p $GALAXY_DEFAULT_ADMIN_PASSWORD


# Container Style
ADD assets/img/full_logo.png $GALAXY_CONFIG_DIR/web/welcome_image.png
ADD assets/img/publication_plots.png $GALAXY_CONFIG_DIR/web/welcome_publication_plots.png
ADD welcome.html $GALAXY_CONFIG_DIR/web/welcome.html
