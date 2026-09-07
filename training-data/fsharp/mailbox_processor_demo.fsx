type Message =
    | Add of int
    | GetTotal of AsyncReplyChannel<int>

let agent =
    MailboxProcessor.Start(fun inbox ->
        let rec loop total =
            async {
                let! msg = inbox.Receive()
                match msg with
                | Add n -> return! loop (total + n)
                | GetTotal reply ->
                    reply.Reply total
                    return! loop total
            }
        loop 0)

agent.Post(Add 5)
agent.Post(Add 10)
agent.Post(Add 3)
printfn "%d" (agent.PostAndReply(GetTotal))
