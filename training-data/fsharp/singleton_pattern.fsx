type ConfigManager private () =
    static let instance = ConfigManager()
    let settings = System.Collections.Generic.Dictionary<string, string>()

    static member Instance = instance

    member _.Set(key: string, value: string) =
        settings.[key] <- value

    member _.Get(key: string) =
        match settings.TryGetValue key with
        | true, v -> Some v
        | false, _ -> None

ConfigManager.Instance.Set("timeout", "30")
printfn "%A" (ConfigManager.Instance.Get "timeout")
printfn "%b" (System.Object.ReferenceEquals(ConfigManager.Instance, ConfigManager.Instance))
