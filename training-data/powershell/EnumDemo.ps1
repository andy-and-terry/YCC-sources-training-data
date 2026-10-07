enum OrderStatus {
    Pending
    Shipped
    Delivered
    Cancelled
}

function Get-StatusMessage([OrderStatus]$status) {
    switch ($status) {
        ([OrderStatus]::Pending)   { return "Order is awaiting processing" }
        ([OrderStatus]::Shipped)   { return "Order is on its way" }
        ([OrderStatus]::Delivered) { return "Order has arrived" }
        ([OrderStatus]::Cancelled) { return "Order was cancelled" }
    }
}

$current = [OrderStatus]::Shipped
Get-StatusMessage $current
[int]$current
[OrderStatus].GetEnumNames()
