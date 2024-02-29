FROM node20:alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm i
RUN npm run build --prod
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
