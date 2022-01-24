FROM node:10 as node

WORKDIR /app
COPY ./ /app
RUN npm install
RUN npm run build 

FROM nginx:1.17
COPY --from=node /app/build /usr/share/nginx/html