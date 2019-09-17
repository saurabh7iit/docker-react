FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#we will get /app/build folder

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#default command of nginx is to to start it, so we dont need to mention it