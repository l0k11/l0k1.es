FROM ubuntu:22.04
WORKDIR /app
COPY . .
RUN chmod 777 *
RUN chmod 777 */*

# Install pnpm
RUN bash -c 'apt update && \
    apt install curl -y && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    corepack enable pnpm'

# Install and configure nginx
RUN bash -c 'apt install nginx -y && \
    mv ./.docker/nginx.conf /etc/nginx/'

# Try to install packages until no errors
RUN bash -c 'error=1; \
while [ $error -ne 0 ]; do \
    pnpm install; \
    error=$?; \
done'

# Build the production app 
RUN bash -c 'pnpm run build'

CMD service nginx start && bash