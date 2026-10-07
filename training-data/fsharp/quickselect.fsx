let rec quickselect (nums: int list) k =
    match nums with
    | [] -> failwith "empty list"
    | pivot :: rest ->
        let smaller = rest |> List.filter (fun x -> x <= pivot)
        let larger = rest |> List.filter (fun x -> x > pivot)
        let smallerLen = List.length smaller

        if k = smallerLen then pivot
        elif k < smallerLen then quickselect smaller k
        else quickselect larger (k - smallerLen - 1)

printfn "%d" (quickselect [ 7; 10; 4; 3; 20; 15; 2 ] 3)
