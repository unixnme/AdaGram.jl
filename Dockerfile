FROM ubuntu:20.04

WORKDIR /root
RUN apt-get update && apt-get install build-essential wget vim unzip git julia -y
#RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.5-linux-x86_64.tar.gz
#RUN tar xfz julia-1.0.5-linux-x86_64.tar.gz
#RUN echo 'PATH=$PATH:/root/julia-1.0.5/bin' >> ~/.bashrc

RUN git clone https://github.com/unixnme/AdaGram.jl.git
WORKDIR /root/AdaGram.jl
RUN sh build.sh
RUN julia -e 'using Pkg; Pkg.add(PackageSpec(url="https://github.com/unixnme/AdaGram.jl.git"))'
RUN wget http://mattmahoney.net/dc/text8.zip -O text8.zip
RUN unzip text8.zip
RUN utils/dictionary.sh text8 text8.dict
