# Usa una imagen base de Go
FROM golang:1.19-alpine AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos go.mod y go.sum primero, para aprovechar la caché de Docker
COPY go.mod ./

# Instala las dependencias
RUN go mod download

# Copia el resto de los archivos
COPY . .

# Compila la aplicación
RUN go build -o app .

# Imagen final
FROM alpine:latest
WORKDIR /root/
COPY --from=build /app/app .
EXPOSE 8080
CMD ["./app"]
