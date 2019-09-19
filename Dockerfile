FROM nginx
## Step 1:
# Copy source code to working directory
COPY content /usr/share/nginx/html
VOLUME /usr/share/nginx/html