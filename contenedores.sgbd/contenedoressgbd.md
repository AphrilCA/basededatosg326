# Contenedores de sistemas gestores de Base de Datos
![ImagenDocker](./img/Gemini_Generated_Image_1k8yrk1k8yrk1k8y.png)
# Comandos docekr con descripcion

| Comando | Descripción |
| :--- | :--- |
**docker --version**|_Verifica la version de docker_|
**docker pull nombre_imagen**|_Descarga una imagen de Docker Hub_ [DockerHub] |
| (tps://hub.docker.com/) |
**docker images**| _Visualiza las imagenes_|
**docker run**| _crea un contenedor_|
**docker ps** |_Visualiza todos los contenedores en ejecucion_| 
**docker container ls**|_Visualiza todos los contenedores en ejecucucion_|
**docker ps- a** | _visualiza todos los contenedores en ejecucion y no ejecucion_|
**docker container ls -a**| _visualiza todos los contenedores en ejecucion y no ejecucion_|
**docker stop nombre_contenedor o ID**| _detiene un contenedor_|
**docker start nombre_contenedor a ID**| _inicia un contenedor_|
**docker rm nombre_contenedor o ID**| _se elimina un contenedor que no esta en ejecucion_|
**docker rm -f nombre_contenedor a ID**| _se elimina un contenedor que no esta en ejecucion_|
**docker volume ls**| _lista los volumenes que tiene docker_|
**docker volume create create nombre_volumen**| _crea un volumen_|
**docker volume rm nombre_volumen**| _elimina un volumen_|

# Comandos de contenedores SGBD

```
docker pull docker/gettin-started
```

### Contenedor de tutorial de docker 

```
docker run -d --name tutorial-docker -p 80:80 docker/getting-started:latest
o
docker run -d --name tutorial-docekr -p 80:80 d7933
```

### Contenedor de MariaDB sin volumen

```
docker run -d --name server-MariaDBG3 -p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345  e0236
```
### Contenedor de MariaDB con volumen

```
docker run -d --name server-MariaDBG3 \
-p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 \
-v vol-mariadbg3:/var/lib/mysql e0236
``` 
### Contenedor de Postgres con volumen
docker run -d --name server-postgresg3 \
-e POSTGRES_PASSWORD-123456 \
-p 5432-5432 -b vol_postgresg3:/var/lib/postgresql/data \


docker run -d --name server-postgresg3 \
-e POSTGRES_PASSWORD=123456 \
-p 5456:5432 -v vol-postgresg3:/var/lib/postgresql/data \
eba8d