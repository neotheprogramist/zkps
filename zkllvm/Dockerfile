FROM debian:bookworm-slim


RUN bash -c "echo 'deb [trusted=yes]  http://deb.nil.foundation/ubuntu/ all main' >>/etc/apt/sources.list"
RUN apt update
RUN apt install -y zkllvm proof-producer curl python3

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN curl --proto '=https' --tlsv1.2 -sSf https://cdn.jsdelivr.net/gh/NilFoundation/zkllvm@master/rslang-installer.py | python3 - --channel nightly

# CMD rustc +zkllvm --version && assigner --version

WORKDIR /app
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]