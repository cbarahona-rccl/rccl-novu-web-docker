# Use the existing web image as base
FROM ghcr.io/novuhq/novu/web:2.1.0

# Modify permissions for index.html
RUN chmod 644 /app/build/index.html

# Set a base path variable, change this value if needed
ENV BASE_PATH="/notifications/novu-web"

# Update href and src attributes in index.html dynamically
RUN sed -i "s|href=\"/|href=\"${BASE_PATH}/|g; s|src=\"/|src=\"${BASE_PATH}/|g" /app/build/index.html

# Command to run the web service
CMD ["/bin/sh", "-c", "pnpm run envsetup:docker && pnpm run start:static:build"]
