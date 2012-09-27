$1 ~ /^A/ {$0 = "AA BB CC DD"}
{print($0, $1, $2, $3, $4)}
