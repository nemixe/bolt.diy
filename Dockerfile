FROM node:20.18.0
WORKDIR /app

# Copy package files and install dependencies
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install

# Copy the rest of your app's source code
COPY . .

# Build the app
RUN pnpm run build

# Start the app
CMD [ "pnpm", "run", "dockerstart" ]
