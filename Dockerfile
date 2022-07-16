FROM emscripten/emsdk:3.1.10

RUN apt update
RUN apt-get install -y autotools-dev automake libtool
RUN wget -O binaryen.tar.gz https://github.com/WebAssembly/binaryen/releases/download/version_109/binaryen-version_109-x86_64-linux.tar.gz && tar -xf binaryen.tar.gz && rm binaryen.tar.gz && mv binaryen-version_109 /
ENV PATH="/binaryen-version_109/bin:${PATH}"
RUN git config --global --add safe.directory '*'
