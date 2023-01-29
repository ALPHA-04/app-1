# Use a Node.js base image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy the application code into the container
COPY . .

# Install the application dependencies
RUN apt-get update && apt-get install -y python-pip
RUN npm install
RUN pip install pytest

# Expose the port on which the application will run
EXPOSE 3001

# Set the command to start the application
CMD [ "npm", "start" ]
