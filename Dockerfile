FROM node
WORKDIR /src
COPY . ./
RUN npm install -f && npm run build

FROM nginx
COPY --from=0 /src/build /usr/share/nginx/html
EXPOSE 80
