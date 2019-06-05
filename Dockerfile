FROM ubuntu:xenial
LABEL maintainer="Amit Agarwal"

RUN apt update && apt install python3-pip git -y && apt clean all
RUN pip3 install robotframework
RUN cd /opt && git clone https://forge.etsi.org/gitlab/nfv/api-tests.git
RUN cd /opt/api-tests && \
    sed -i 's/robotframework-jsonlibrary==0.2/robotframework-jsonlibrary/' requirements.txt && \
    pip3 install -r requirements.txt

WORKDIR /opt/api-tests
ENTRYPOINT /bin/bash


## TODO - configure the api-tests scrips automatically based on env variables.
#Some variables to make life easier

# ENV VNFM_HOST localhost
# ENV AUTHORIZATION Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9

