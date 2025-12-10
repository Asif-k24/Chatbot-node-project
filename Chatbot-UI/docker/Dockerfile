# Use official Node.js LTS image
FROM node:20
# Set working directory
WORKDIR /app
# Copy package.json and package-lock.json
COPY package*.json ./
# Install dependencies
RUN npm install --legacy-peer-deps
# Copy app source code
#COPY . .

# Copy built application
COPY .next ./.next
COPY public ./public
COPY node_modules ./node_modules
COPY package.json ./
COPY next.config.js ./
COPY next-i18next.config.js ./

# Build the app
# RUN npm run build
# Expose port 3000
EXPOSE 3000
# Start the app
CMD ["npm", "start"]
