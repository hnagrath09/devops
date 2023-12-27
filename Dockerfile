# Base image
FROM node:lts-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and yarn.lock to the app directory
COPY ["package.json", "yarn.lock", "./"]

# Install app dependencies
RUN yarn install

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN yarn build

# Expose port 3000
EXPOSE 3000

# Start the server using the production build
CMD ["yarn", "start:prod"]
