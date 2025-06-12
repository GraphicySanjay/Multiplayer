FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    wget libx11-6 libxcursor1 libxrandr2 libxinerama1 \
    libxi6 libasound2 libpulse0 libglib2.0-0 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download server binary
RUN wget -O server.x86_64 "https://www.dropbox.com/scl/fi/peqna25pzfwkwbv29f6kl/server.x86_64?rlkey=7ohe087lzbialzgon0bn8u782&st=6jowus1t&dl=1" && \
    chmod +x server.x86_64

# Download .pck file
RUN wget -O index.pck "https://www.dropbox.com/scl/fi/680coonplxvnfqn4f31or/index.pck?rlkey=oabq0bau2nijpi7ro8h1iahe4&st=ks4shxot&dl=1"

EXPOSE 8910

CMD ["./server.x86_64", "--main-pack", "index.pck", "--no-window", "--disable-render-loop"]
