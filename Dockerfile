FROM python:alpine

RUN apk --no-cache add git openssh-client

RUN apk --no-cache add --virtual .deps build-base libffi-dev libressl-dev linux-headers && \
    pip install ansible ansible-lint boto shade yamllint && \
    apk --no-cache del --purge .deps
