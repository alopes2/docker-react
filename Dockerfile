#BUILD PHASE
FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#SERVE PHASE
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

#The default command for nginx image is to start nginx

