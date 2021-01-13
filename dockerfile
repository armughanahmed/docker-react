FROM node:12-alpine as builder

WORKDIR "/app"

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
# expose  == docker run -p 3000:3000 container-id
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
