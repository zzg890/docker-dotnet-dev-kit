docker build -t zzg890/dotnet-devkit .
docker push zzg890/dotnet-devkit

docker tag zzg890/dotnet-devkit zzg890/dotnet-devkit:5.0
docker push zzg890/dotnet-devkit:5.0
