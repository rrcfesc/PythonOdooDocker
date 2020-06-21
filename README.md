# PythonOdooDocker

This is an imagen base to start development on Odoo CE and Odoo Enterprise, also Django V2.X.X, this image doesnt contains: repository, code or volumes. Only technical requirements.

## How to Use

Example of dockerFile :

```yml
version: '2.4'
services:
  web:
    image: rrcfesc/pythonodoodocker:13.0
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
      hostname: "odooskeleton_db"
      container_name: "odooskeleton_db"
      volumes:
        - ./database2:/var/lib/postgresql/data
      environment:
        POSTGRES_PASSWORD: "passwd"
        POSTGRES_DB: "odooskeleton"
```

### Django version

v2.X.X

### Considerations

This image has support over Odoo v13

### Support/Issues

send me a email to <rrcfesc@gmail.com>
