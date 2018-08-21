FROM python:3

RUN pip install ansible ansible-lint boto rsync shade yamllint
