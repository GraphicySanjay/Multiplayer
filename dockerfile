FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    libxcursor1 libxinerama1 libxrandr2 libxi6 libglib2.0-0 libasound2 wget unzip ca-certificates \
    && apt-get clean

COPY export/server/server.x86_64 /app/server
WORKDIR /app

RUN chmod +x /app/server

EXPOSE 8910  # change this if your game uses a different port

CMD ["./server"]
