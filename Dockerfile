FROM node:alpine as builder
WORKDIR "/app/client"
COPY ./client/package.json ./
RUN npm install
COPY ./client ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/client/build /usr/share/nginx/html