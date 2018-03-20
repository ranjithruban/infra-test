FROM python:3
COPY docker/static-assets/serve.py  /root/serve.py
COPY docker/static-assets/css/   /root/css
WORKDIR /root
CMD ["/root/serve.py"]
