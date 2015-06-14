FROM ansible/ubuntu14.04-ansible:stable

RUN apt-get update
RUN apt-get install -y python-boto

RUN export AWS_ACCESS_KEY_ID="AKIAIG27TL5CBM32YW3Q"
RUN export AWS_SECRET_ACCESS_KEY="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"

# Other Dockerfile directives are still valid
RUN mkdir ~/.aws
COPY config/boto ~/.boto
# COPY config/credentials ~/.aws/

# Add playbooks to the Docker image
ADD ~/ansible-playbooks /srv/ansible/
WORKDIR /srv/ansible

# Run Ansible to configure the Docker image
# RUN ansible-playbook site.yml -c local
