FROM mcr.microsoft.com/dotnet/sdk:6.0

ENV NETCORE_ENVIRONMENT=Docker
ENV ASPNETCORE_ENVIRONMENT=Docker
ENV DOTNET_ENVIRONMENT=Docker
ENV DOTNET_RUNNING_IN_CONTAINER=true
ENV DOTNET_USE_POLLING_FILE_WATCHER=true
ENV DEBIAN_FRONTEND=noninteractive

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - 
RUN apt update
RUN apt-get install -y nodejs
RUN npm install -yY npm@latest -g
RUN npm config set registry https://registry.npm.taobao.org


RUN echo fs.inotify.max_user_instances=524288 |  tee -a /etc/sysctl.conf

RUN apt-get install -y --no-install-recommends --force-confdef procps 
# Install Visual Studio Remote Debugger
RUN curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l ~/vsdbg 


#Install tzdata
RUN apt install -y tzdata
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#Intall Vim
RUN apt install -y vim 

RUN apt install -y net-tools
