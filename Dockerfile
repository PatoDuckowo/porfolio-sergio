FROM node:22-slim

ENV ASTRO_TELEMETRY_DISABLED=1

WORKDIR /app
RUN chown node:node /app
USER node

COPY package.json package-lock.json ./
RUN npm ci --no-audit --no-fund

EXPOSE 4321
CMD ["npx", "astro", "dev", "--host", "0.0.0.0", "--port", "4321", "--allowed-hosts"]
