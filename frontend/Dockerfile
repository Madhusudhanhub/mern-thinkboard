# Stage 1: Build React app
FROM node:18-alpine as builder

WORKDIR /app
COPY package*.json ./
RUN npm install  # ← don't omit dev here because vite is required

COPY . .
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

