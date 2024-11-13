# Etapa de construcción
FROM golang:1.19-alpine AS build

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo app.go al contenedor
COPY app.go .

# Compilar el binario de la aplicación
RUN go build -o app .

# Imagen final
FROM alpine:latest

# Copiar el binario desde la etapa de construcción
COPY --from=build /app/app /app

# Exponer el puerto 8080
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["/app"]
