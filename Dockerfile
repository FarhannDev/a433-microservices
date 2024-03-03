# Stage 1: Build
# Menggunakan node:14 sebagai base image untuk membangun aplikasi
FROM node:14 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY . .

EXPOSE 3000

# Set environment variables
ENV AMQP_URL=amqp://localhost:5672

CMD ["npm", "run", "start"]