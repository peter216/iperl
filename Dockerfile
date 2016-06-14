# Orig source: https://gist.github.com/dbiesecke/c57874957bed9812c5f0
# Use offical jupyter image and added iperl
#
# Add AOL libraries and dependencies
#
# docker build -t iperl .
# docker run --name iperl -d -p 8000:8888 -v "$(pwd):/notebooks" iperl
FROM jupyter/notebook

# MAINTAINER Daniel Biesecke <dbiesecke@gmail.com>
MAINTAINER Peter Rubenstein <peter.rubenstein@teamaol.com>

RUN  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
                libzmq3-dev libmagic-dev cpanminus ssh

RUN git clone https://github.com/EntropyOrg/p5-Devel-IPerl.git /iperl
RUN cd /iperl/ && cpanm --installdeps . && cpanm SOAP::Lite SOAP::Data
RUN jupyter-kernelspec install /iperl
RUN mkdir -p -m 700 /root/.jupyter/ && \
    echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.MultiKernelManager.default_kernel_name = 'iperl'" 

RUN rm -fR /root/.cpanm/work/*
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get purge -y --auto-remove \
        -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false $BUILD_DEPS

RUN mkdir /root/.ssh && chmod -R 600 /root/.ssh
COPY .ssh /root/.ssh/
RUN git clone ssh://git@stash.ops.aol.com:2022/neot/neo-scripts.git /neo-scripts

ENTRYPOINT ["/iperl/bin/iperl"]
CMD ["notebook", "--allow-root"]

