# Use the existing web image as base
FROM ghcr.io/novuhq/novu/web:2.0.0

# Set the working directory inside the container
WORKDIR /app

RUN chmod 644 /app/build/index.html

# Copy the new index.html from local to container
COPY index.html /app/build/index.html

# Ensure proper ownership (adjust user if necessary)
RUN chmod 100 /app/build/index.html

# Command to run the web service
CMD ["/bin/sh", "-c", "pnpm run envsetup:docker && pnpm run start:static:build"]
