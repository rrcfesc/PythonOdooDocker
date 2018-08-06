FROM ubuntu:16.04

LABEL mantainer "rrcfesc@gmail.com"

ENV USER odoo
ENV VERSION 11.0

RUN apt-get update && apt-get install -y locales
RUN set -x; \
    locale-gen es_MX.UTF-8 && \
    update-locale && \
    echo 'LANG="es_MX.UTF-8"' > /etc/default/locale
RUN apt-get install -y python-pip python3-pip libxml2-dev libxslt-dev libevent-dev libsasl2-dev libldap2-dev python-lxml python3-lxml libjpeg-dev \
    libssl-dev python-dev python3-dev curl wget unzip locales tree wkhtmltopdf tmux vim
RUN pip install -U pip && pip3 install -U pip
RUN useradd  -m -d /home/${USER} -s /bin/bash ${USER}
RUN passwd ${USER} -d
RUN wget https://raw.githubusercontent.com/odoo/odoo/11.0/requirements.txt
RUN LC_ALL=C.UTF-8 LANG=C.UTF-8 python3.5 -m pip install -Ur requirements.txt &&  rm requirements.txt
RUN wget https://raw.githubusercontent.com/odoo/odoo/10.0/requirements.txt -O /tmp/req10.txt
RUN python2.7 -m pip install -Ur /tmp/req10.txt && rm /tmp/req10.txt
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN chmod +x nodesource_setup.sh && ./nodesource_setup.sh && rm nodesource_setup.sh
RUN apt-get install nodejs curl -y
RUN python2.7 -m pip install -U bpython && python3.5 -m pip install -U bpython
RUN python3 -m pip install pyopenssl
RUN python3 -m pip install ebaysdk
ADD extraFiles/entrypoint.sh /usr/local/bin/entrypoint.sh
ADD extraFiles/supervisor.conf /etc/supervisord.conf
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN easy_install supervisor
RUN ls -al /usr/local/bin/entrypoint.sh

EXPOSE 8069

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
