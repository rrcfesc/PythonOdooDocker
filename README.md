# PythonOdooDocker
Its a imagen base to start development Odoo CE and Odoo Enterprise, no contains repository or images or volumes. Only technical requirements.

## How to Use
Example of dockerFile :

```
version: '2'
services:
  web:
    image: pythonodoo:11.0
    ports:
      - "8069:8069"
    volumes:
      - ~/.ssh:/home/odoo/.ssh
      - ./odoo-repo:/home/odoo/odoo-repo
    container_name: odooskeleton-odoo
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
### Considerations
Alway use or change de odoo User
```
# su odoo
$ pwd
/home/odoo
```
