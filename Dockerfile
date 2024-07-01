FROM node:lts AS runtime

WORKDIR /app

# Copy package.json and pnpm-lock.yaml (if available) first for caching
COPY package.json pnpm-lock.yaml* ./

# Install pnpm globally (optional, but recommended for better caching)
RUN npm install -g pnpm

# Install sharp globally (since Astro might need it during build)
RUN pnpm add sharp

# Copy the rest of the application code
COPY . .

# Build your application (if needed)
RUN pnpm run build

# Set environment variables
ENV HOST=0.0.0.0
ENV PORT=4321

# Expose the port your app runs on
EXPOSE 4321

# Start the development server
CMD ["pnpm", "dev"]