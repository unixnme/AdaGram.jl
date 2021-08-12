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
RUN wget 'https://onedrive.live.com/download?cid=70E885CC72F916BC&resid=70E885CC72F916BC%215680&authkey=AGm2uPHbNxHL3Yk' -O 1bil.test.txt.bz2
RUN bunzip2 1bil.test.txt.bz2
RUN utils/tokenize.sh 1bil.test.txt 1bil.test.tok
RUN utils/dictionary.sh 1bil.test.tok 1bil.test.dict
