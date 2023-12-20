# Use an official Node.js image as the base image
FROM node:14-alpine as builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Build the React app
RUN npm run build

# Use a lightweight Nginx image as the final image
FROM nginx:alpine

# Copy the built files from the builder stage to the Nginx public directory
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# The default command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]
