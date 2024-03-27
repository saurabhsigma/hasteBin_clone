# Use Node.js image as base for backend
FROM node:latest AS backend

# Set working directory for backend
WORKDIR /usr/src/app

# Copy backend files
COPY package*.json ./
COPY server.js ./
COPY models/ ./models
RUN npm install

# Use Nginx image as base for frontend
FROM nginx:latest AS frontend

# Copy frontend files to Nginx default public directory
COPY public/ /usr/share/nginx/html

# Expose port for Nginx
EXPOSE 80
