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
      hostname: "odooskeleton_db"
      container_name: "odooskeleton_db"
      volumes:
        - ./database2:/var/lib/postgresql/data
      environment:
        POSTGRES_PASSWORD: "passwd"
        POSTGRES_DB: "odooskeleton"
```
### Django version
v2.1.1

### Considerations


### Support/Issues
send me a email to <rrcfesc@gmail.com>
