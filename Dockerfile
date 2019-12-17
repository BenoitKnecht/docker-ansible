FROM python:alpine3.10

RUN apk --no-cache add git git-lfs gnupg libffi libressl openssh-client

RUN ln -s ../local/bin/python /usr/bin/python

RUN apk --no-cache add --virtual .deps build-base libffi-dev libressl-dev linux-headers && \
    pip install ansible==2.9.2 ansible-lint boto cryptography mitogen==0.2.9 openstacksdk yamllint && \
    apk --no-cache del --purge .deps

RUN mkdir -p /usr/share/ansible/plugins && \
    ln -s "$(pip show mitogen | awk '/^Location: / { print $2 }')/ansible_mitogen/plugins/strategy" /usr/share/ansible/plugins
