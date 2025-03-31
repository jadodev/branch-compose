FROM node:20-alpine

WORKDIR /app

# Clona el repositorio directamente en el contenedor
RUN apk add --no-cache git && \
    git clone https://github.com/jadodev/crud-store.git /app

# Instala pnpm
RUN npm install -g pnpm

# Instala las dependencias
RUN pnpm install

# Expón el puerto donde la app correrá
EXPOSE 3001

CMD ["pnpm", "run", "start"]
