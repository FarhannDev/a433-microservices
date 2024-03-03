# Build Docker Application Use Multi Stage
# Stage 1: Build Application Mode Production
FROM node:18-alpine as builder
WORKDIR /src
COPY package*.json ./
RUN npm install --only=production
COPY . .

# Stage 2: Build Application Mode Development
FROM builder as development
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh
RUN npm install --only=development

# Final stage for Production
FROM builder as production
ENV NODE_ENV=production

# Expose port 3000 for the application
EXPOSE 3000

# Set NODE_ENV to development (for explanation purpose only)
ENV NODE_ENV=development

CMD ["node", "index.js"]

