FROM node:14.17 as node

WORKDIR /app
COPY ./ /app
RUN npm install
RUN npm run build -- --prod

FROM nginx:1.17.10
COPY --from=node /build /usr/share/nginx/html