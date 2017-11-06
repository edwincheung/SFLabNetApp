#!/bin/bash
DIR=`dirname $0`
dotnet restore $DIR/../SFLabNetApp/src/SFLabNetApp/SFLabNetActor.Interfaces/SFLabNetActor.Interfaces.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../SFLabNetApp/src/SFLabNetApp/SFLabNetActor.Interfaces/SFLabNetActor.Interfaces.csproj -v normal

CURDIR=`pwd`
dotnet restore $DIR/../SFLabNetApp/src/SFLabNetApp/SFLabNetActorService/SFLabNetActorService.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../SFLabNetApp/src/SFLabNetApp/SFLabNetActorService/SFLabNetActorService.csproj -v normal
cd `dirname $DIR/../SFLabNetApp/src/SFLabNetApp/SFLabNetActorService/SFLabNetActorService.csproj`
dotnet publish -o $CURDIR/../SFLabNetApp/SFLabNetApp/SFLabNetActorPkg/Code
cd -


dotnet restore $DIR/../SFLabNetApp/src/SFLabNetApp/SFLabNetActorTestClient/SFLabNetActorTestClient.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../SFLabNetApp/src/SFLabNetApp/SFLabNetActorTestClient/SFLabNetActorTestClient.csproj -v normal
cd `dirname $DIR/../SFLabNetApp/src/SFLabNetApp/SFLabNetActorTestClient/SFLabNetActorTestClient.csproj`
dotnet publish -o $CURDIR/../SFLabNetApp/SFLabNetActorServiceTestClient
cd -
