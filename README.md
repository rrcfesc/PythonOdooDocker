# PythonOdooDocker
Its a imagen base to start development Odoo CE and Odoo Enterprise, also Django V2.1.1, no contains repository or images or volumes. Only technical requirements.

## How to Use
Example of dockerFile :

```
version: '2'
services:
  web:
    build:
      context: .
      dockerfile: ./Dockerfile
    restart : always
    container_name: "rioxygen_web"
    expose:
      - "3000"
    ports:
      - "8000:8000"
    volumes:
      - ~/.ssh:/home/odoo/.ssh
      - ./src:/home/odoo/source
    links:
      - postgresql:postgresql
    depends_on:
      - postgresql
  postgresql:
    image: postgres:10
    restart : always
    container_name: "rioxygen_db"
    ports:
      - "5432:5432"
    volumes:
      - ./database:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: "odoo"
      POSTGRES_PASSWORD: "passwd"
      POSTGRES_DB: odooskeleton
```
## Suport to django proyects


```Dockerfile
FROM rrcfesc/pythonodoodocker:11.0

ENV USER odoo

ADD requirements.txt requirements.txt
RUN LC_ALL=C.UTF-8 LANG=C.UTF-8 python3.5 -m pip install -Ur requirements.txt &&  rm requirements.txt

USER ${USER}
WORKDIR /home/${USER}

EXPOSE 8069 8000

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
```

### Considerations


### Support/Issues
send me a email to <rrcfesc@gmail.com>
