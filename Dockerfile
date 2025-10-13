# Using a base Ubuntu image
FROM ubuntu

#Installing vim Text Editor and Figlet for Banner Utility
RUN apt-get update
RUN apt-get install figlet -y

# Copy the Entire Directory into the container
COPY . /app

# Ensure the script has executable permissions
RUN chmod +x /app/INIT.sh

# Set the default command to execute the script
ENTRYPOINT ["/bin/bash", "/app/INIT.sh"]
CMD ["$1", "$2"]

