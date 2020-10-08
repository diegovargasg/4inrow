FROM node:alpine as builder
WORKDIR "/app/client"
COPY ./client/package.json ./
RUN npm install
COPY ./client ./
RUN npm run build

FROM nginx
COPY --from=builder /app/client/build /usr/share/nginx/html