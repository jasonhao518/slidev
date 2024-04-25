FROM node:18-alpine

WORKDIR /slidev

ENV CHOKIDAR_USEPOLLING=true

RUN npm install -g @slidev/cli @slidev/theme-default @slidev/theme-seriph
RUN npm install -g @slidev/theme-bricks
RUN npm install -g magic-string-stack

COPY packages/slidev/dist /usr/local/lib/node_modules/@slidev/cli/dist
COPY packages/types/dist /usr/local/lib/node_modules/@slidev/cli/node_modules/@slidev/types/dist
COPY packages/parser/dist /usr/local/lib/node_modules/@slidev/cli/node_modules/@slidev/parser/dist
COPY packages/client /usr/local/lib/node_modules/@slidev/cli/node_modules/@slidev/client



RUN touch /slidev/slides.md

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
