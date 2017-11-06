namespace SFLabNetActorClient
{
    using System;
    using Microsoft.ServiceFabric.Actors;
    using Microsoft.ServiceFabric.Actors.Client;
    using SFLabNetActor.Interfaces;

    class Program
    {
        static void Main(string[] args)
        {
            var SFLabNetActorTestClient = ActorProxy.Create<ISFLabNetActor>(new ActorId(0x100), "fabric:/SFLabNetApp" , "SFLabNetActor");
            int result = SFLabNetActorTestClient.GetCountAsync().Result;
            SFLabNetActorTestClient.SetCountAsync(result + 1).Wait();
            Console.WriteLine("Value = {0}", result);
        }
    }
}
