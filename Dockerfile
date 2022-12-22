FROM mcr.microsoft.com/dotnet/sdk:7.0 as builder
WORKDIR /src
#Copy source code to builder
COPY . .
#Restore as distinct layers
RUN dotnet restore
#Build and publish a release
RUN dotnet publish -c Release -o publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0
ENV ASPNETCORE_ENVIRONMENT=Development
WORKDIR /app
COPY --from=builder /src/publish .
ENTRYPOINT [ "dotnet", "dotnet-webapi.dll" ]