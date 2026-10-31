<?php
function isSelfDescribing(string $s): bool {
    for ($i = 0; $i < strlen($s); $i++) {
        if (substr_count($s, (string) $i) !== (int) $s[$i]) return false;
    }
    return true;
}

foreach (["1210", "2020", "21200", "1211"] as $s) {
    echo $s, " ", isSelfDescribing($s) ? "true" : "false", "\n";
}
