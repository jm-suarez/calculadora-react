FROM node:18-alpine AS BUILD_STAGE
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:alpine AS FINAL_STAGE
COPY --from=BUILD_STAGE /app/build/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]