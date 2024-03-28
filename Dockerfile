# # Use Node.js image as base for backend
# FROM node:latest AS backend

# # Set working directory for backend
# WORKDIR /usr/src/app

# # Copy backend files
# COPY package*.json ./
# COPY server.js ./
# COPY models/ ./models
# RUN npm install

# # Use Nginx image as base for frontend
# FROM nginx:latest AS frontend

# # Copy frontend files to Nginx default public directory
# COPY public/ /usr/share/nginx/html

# # Expose port for Nginx
# EXPOSE 80


# Use a base image with Node.js pre-installed
FROM node:latest 

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 5000 for the Express server
EXPOSE 3001

# # Define environment variables
# ENV NODE_ENV=production
# ENV PORT=5000

# Command to run the server
CMD ["npm", "start"]

