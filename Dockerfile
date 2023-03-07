# Dockerfile

FROM python:3.8-buster

# install nginx
RUN apt-get update

# copy source and install dependencies
RUN mkdir -p /opt/app
RUN mkdir -p /opt/app/pip_cache
WORKDIR /opt/app
COPY requirements.txt /opt/app/


#COPY .pip_cache /opt/app/pip_cache/
RUN pip install Cython==0.29.28
RUN pip install git+https://github.com/vishwachennakrishnappa/dlkp/
RUN pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_md-3.4.0/en_core_web_md-3.4.0-py3-none-any.whl
RUN pip install -r requirements.txt
COPY . /opt/app/
#RUN chmod +x /opt/app/start-server.sh

#change the adobe library file for cross-device operation change change
COPY enterprise_search/pdf_parser/patches/file_ref_impl.py /usr/local/lib/python3.7/site-packages/adobe/pdfservices/operation/internal/io/file_ref_impl.py

# start server
STOPSIGNAL SIGTERM
#CMD ["/opt/app/start-server.sh"]
ENTRYPOINT ["sh", "/opt/app/start-server.sh"]
