# Use official Node.js LTS image
FROM node:20-alpine AS base
# Set working directory
WORKDIR /app
# Copy package.json and package-lock.json
COPY package*.json ./
# Install dependencies
From base AS dependencies
RUN npm ci --legacy-peer-deps
# Build the application
FROM base AS dependencies
COPY . .
RUN npm run build
# Production
FROM node:20-alpine AS production
WORKDIR /app
COPY --from=dependencies /app/node_modules ./node_modules
COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public
COPY --from=build /app/package*.json ./
COPY --from=build /app/next.config.js ./next.config.js
COPY --from=build /app/next-i18next.config.js ./next-i18next.config.js
# Expose port 3000
EXPOSE 3000
# Start the app
CMD ["npm", "start"]
