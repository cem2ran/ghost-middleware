# Pull base image.
FROM dockerfile/nodejs

# Install Ghost
RUN \
  git clone https://github.com/cem2ran/ce.ms.git /ghost && \
  cd /ghost && npm install && \
  useradd ghost --home /ghost

# Add files.
ADD start.bash /ghost-start

# Set environment variables.
ENV NODE_ENV production

# Define mountable directories.
VOLUME ["/data", "/ghost-override"]

# Define working directory.
WORKDIR /ghost

# Define default command.
CMD ["bash", "/ghost-start"]

# Expose ports.
EXPOSE 2368
