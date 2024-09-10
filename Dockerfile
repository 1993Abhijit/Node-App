# Build stage
FROM node:18-alpine AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=prod
RUN npm cache clean --force
COPY app.js ./
COPY views ./views/

# Production stage
FROM node:18-alpine
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
# Prune dependencies
RUN npm prune --production

# Remove unnecessary files
RUN rm -rf /usr/src/app/npm-debug.log /usr/src/app/npm-error.log

EXPOSE 8000
CMD ["node", "app.js"]
