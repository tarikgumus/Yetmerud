FROM miningcontainers/xmrig:latest



COPY docker-entrypoint.sh /usr/local/bin/
COPY baslat.py /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/baslat.py

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

EXPOSE 17075
EXPOSE 443

ENTRYPOINT ["docker-entrypoint.sh"]

