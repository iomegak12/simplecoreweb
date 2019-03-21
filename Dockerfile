FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build

COPY . /app
WORKDIR /app

RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime

WORKDIR /app
COPY --from=build /app/WebApplication1/out ./

ENTRYPOINT ["dotnet", "WebApplication1.dll"]