# Docker image for basic Jenkins slave

FROM apemberton/jenkins-base
MAINTAINER Andy Pemberton <apemberton@cloudbees.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
    git

RUN ["mkdir", "/data"]
RUN ["chown", "-R", "jenkins:jenkins", "/data"]
USER jenkins
VOLUME ["/data"]
WORKDIR /data

CMD ["git", "clone", "https://github.com/apemberton/demo-base.git", "."]