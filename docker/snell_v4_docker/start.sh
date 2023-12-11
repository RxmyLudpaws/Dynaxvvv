rm -f /root/snell-server.conf
cat > /root/snell-server.conf <<EOF
{
[snell-server]
listen = 0.0.0.0:8388
psk = ${PSK}
ipv6 = true
obfs = off
}
EOF
cd /root && ./snell-server -c /root/snell-server.conf
