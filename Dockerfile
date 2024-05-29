FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build the path of built file

FROM nginx
#EXPOSE ONLY FOR ELASTIC BEANSTALK
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html

