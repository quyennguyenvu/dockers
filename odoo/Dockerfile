FROM ubuntu:16.04

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN set -x; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    node-less \
    python-dateutil \
    python-docutils \
    python-feedparser \
    python-jinja2 \
    python-ldap \
    python-libxslt1 \
    python-lxml \
    python-mako \
    python-mock \
    python-openid \
    python-psycopg2 \
    python-psutil \
    python-pybabel \
    python-pychart \
    python-pydot \
    python-pyparsing \
    python-reportlab \
    python-simplejson \
    python-tz \
    python-unittest2 \
    python-vatnumber \
    python-vobject \
    python-webdav \
    python-werkzeug \
    python-xlwt \
    python-yaml \
    python-zsi \
    poppler-utils \
    python-pip \
    python-pypdf \
    python-passlib \
    python-decorator \
    gcc \
    python-dev \
    mc \
    bzr \
    python-setuptools \
    python-markupsafe \
    python-reportlab-accel \
    python-zsi \
    python-yaml \
    python-argparse \
    python-openssl \
    python-egenix-mxdatetime \
    python-usb \
    python-serial \
    lptools \
    make \
    python-pydot \
    python-psutil \
    python-paramiko \
    poppler-utils \
    python-pdftools \
    antiword \
    python-requests \
    python-xlsxwriter \
    python-suds \
    python-ofxparse \
    python-gevent \
    npm \
    wget \
    unzip

RUN pip install psycogreen
RUN pip install --upgrade google-api-python-client
RUN pip install --upgrade oauth2client
RUN pip install --upgrade pika
RUN pip install jsonschema
RUN pip install IPy
RUN pip install marshmallow

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g less less-plugin-clean-css

# step 6
RUN adduser --system --home=/opt/odoo --group odoo

# step 7
WORKDIR /opt/odoo
RUN wget https://pypi.python.org/packages/a8/70/bd554151443fe9e89d9a934a7891aaffc63b9cb5c7d608972919a002c03c/gdata-2.0.18.tar.gz &&  tar zxvf gdata-2.0.18.tar.gz
RUN chown -R odoo: gdata-2.0.18
WORKDIR /opt/odoo/gdata-2.0.18/
RUN python setup.py install

# Install Odoo
ENV ODOO_VERSION 10.0
ENV ODOO_RELEASE 20181109
WORKDIR /opt/odoo
RUN wget https://github.com/odoo/odoo/archive/10.0.zip \
&&  unzip 10.0.zip
RUN chown -R odoo: odoo-10.0
RUN mkdir /var/log/odoo
RUN chown -R odoo:root /var/log/odoo

# install WKHTMLTOPDF
RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb
RUN dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb
RUN cp /usr/local/bin/wkhtmltoimage /usr/bin/wkhtmltoimage
RUN cp /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf

# Copy entrypoint script and Odoo configuration file
COPY ./entrypoint.sh /
COPY ./etc/odoo.conf /etc/odoo/
RUN chown odoo /etc/odoo/odoo.conf

# # Mount /var/lib/odoo to allow restoring filestore and /mnt/extra-addons for users addons
# RUN mkdir -p /mnt/extra-addons \
#     && chown -R odoo /mnt/extra-addons
# VOLUME ["/var/lib/odoo", "/mnt/extra-addons"]

# # Expose Odoo services
# EXPOSE 8069 8071

# # Set the default config file
# ENV ODOO_RC /etc/odoo/odoo.conf

# create addons project
RUN mkdir -p /Workspace/Teko/finance-addons

# Set default user when running the container
USER odoo

# ENTRYPOINT ["/entrypoint.sh"]

# WORKDIR /opt/odoo/odoo-10.0
# CMD ["./odoo-bin -c /etc/odoo.conf"]