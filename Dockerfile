FROM python:alpine

RUN apk --no-cache add git openssh-client

RUN pip install ansible ansible-lint boto shade yamllint
