# Utilizar la imagen oficial de Node.js versión 18
FROM node:18-alpine

# Establecer el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiar los archivos necesarios de la aplicación al contenedor
COPY package.json package-lock.json ./
COPY app.js ./
COPY views ./views/

# Instalar las dependencias de la aplicación
RUN npm install

# Exponer el puerto 8000
EXPOSE 8000

# Comando para ejecutar la aplicación
CMD ["node", "app.js", "&"] 
