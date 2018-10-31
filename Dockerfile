FROM python:alpine

RUN apk --no-cache add git git-lfs gnupg openssh-client

RUN ln -s ../local/bin/python /usr/bin/python

RUN apk --no-cache add --virtual .deps build-base libffi-dev libressl-dev linux-headers && \
    pip install ansible==2.7.1 ansible-lint boto mitogen==0.2.3 shade yamllint && \
    apk --no-cache del --purge .deps

RUN mkdir -p /usr/share/ansible/plugins && \
    ln -s "$(pip show mitogen | awk '/^Location: / { print $2 }')/ansible_mitogen/plugins/strategy" /usr/share/ansible/plugins
