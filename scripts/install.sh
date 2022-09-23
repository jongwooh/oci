#!/bin/bash
#
# LICENSE UPL 1.0
#
# Copyright (c) 1982-2018 Oracle and/or its affiliates. All rights reserved.
#
# Since: January, 2018
# Author: gerald.venzl@oracle.com
# Description: Updates Oracle Linux to the latest version
#
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
#

echo 'INSTALLER: Started up'

# get up to date
# dnf upgrade -y

echo 'INSTALLER: System updated'

# fix locale warning
echo LANG=en_US.utf-8 >> /etc/environment
echo LC_ALL=en_US.utf-8 >> /etc/environment

echo 'INSTALLER: Locale set'

echo 'INSTALLER: OCI CLient'
dnf -y install oraclelinux-developer-release-el8
dnf -y install python36-oci-cli

mkdir ~/.oci
cat > ~/.oci/config <<EOF
[DEFAULT]
user=ocid1.user.oc1..aaaaaaaaaewpov3jzv6dpqhwabblqwnfqcj5bvgkdtn4nifvfzkqsrt5dnvq
fingerprint=36:e4:a7:82:44:d0:95:f0:b8:0e:66:e9:e3:90:7d:6c
key_file=/home/vagrant/.oci/oci_api_key.pem
tenancy=ocid1.tenancy.oc1..aaaaaaaakjmwsk42owbuvcf2xrzc3svvi3hjtm7azhys2azgpolcqjybxukq
region=ap-singapore-1
EOF

cat > ~/.oci/oci_api_key.pem <<EOF
-----BEGIN PRIVATE KEY-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDnEqVwRhQleTry
7iIbP20c4oRG+QUrvS9ISnGRO9MTq0waQ8ClSavwHFnYKnI3JwbDPdd3cQIuzMUq
0cZJIYeDem1EhIaaBgJNx3oJGS44XoE5gZa8Qbg6bFAEeT88ARUGK+Tss64GUNas
meE/VUj+SsLhkhZ5hYgu0fnQzQqaLLV720BIl3MDPt3W+9xDomlalTDc1wBUVD2m
JvBI1JHTvLVKCvkibryn+rosY3M2gPFQ8PC1EZbOXVOX066uGEMjd5gO/ZpLeDVn
rd/Jd3ce2cEkgjIT1f8k0fQdpgg6m739FlA1nX9FJAERnAbleXDMCRNRNMUX8xnE
HrZHua9XAgMBAAECggEAKIh0zMT+M7SYSpTLFsyBb1esrGZyKcH90Uh9s2QzGngp
2VGZMWVC69ONTwXjExmdbhIjAaipIVx6GZDCn4FqK/4FvMcidVIohUxAc+ge23R4
ZoX80vkUP+tP/fjmxrfJ4FNCzOKX3DPB9HTpthpXu4ORu8/McXSi9tOOZroQ6goo
ULBhtXEaBoyom/IcWA6Ple6xxwIZkqgGm6Lj1pAzZPo8iBF/7twNygMWos+1/SsZ
mcArV53+5D7TMT3xPz48awtICDpxzBsVX7JHrS2nr7eJ/tUlWoq8IwVpGQ/5xI9u
zx2WEJRU/ir69e0Ana54D5FPyyhcRt6e94a4q0pOwQKBgQD5bztELacSkjwg/+D4
y8I2OtDqeTif0vdDpVoTXuvsE535XQAxmzPp3AWEhrGNjETHGLXIrNaQbojxR6l9
Ziu2sgTQtlaXRaXD4TdJyesco37XO9u55C2xv1G9wMPLysORoeg6tryp+8U0rjPB
lhz/vHP0iCVo+rBbMV44eGUeQwKBgQDtJ7Akl+/aqMz0lmBcNHiGZdFJSmnPYt03
NG4Zc7TDNTd2kx7pAyH1C1v8r7VDnnPz9FEiKHIbKvhh9JItEWwFjlCvCjYyzIcN
sy+yVgKJNyQvERv0XOfAtXSKe635tUu3hdZ/W1+NFKOJ6yhZBlclv2KKSa4aZP1+
H+W4YEb7XQKBgQCdoi75OkSwltwLGspJUTPOY8MtuygO0RtUk8XmIgHEsu0N7zk1
IFlhfJu8EgdZZgD9Nd+ED76VjlVa7iftyMjtb3ldkS4N8YT90nHHXyUHd0esq/aD
dvFtuHPnEFBslRqdCY4itONsJWGOlly9BaoT8DvzmKrTukIDj6J025lD0wKBgQDr
gUMZQ8yLjp9hsEdmqTCa/ldT+dKTgLD/VlCTc+SpCZrXZIgIivTYu/wQNYjC6oJp
W1CKpDGUKxrXY6EZojhsWARlnrVtws/G2g9egK0qCBklqE7jXrNCGq/tqZ593/yd
9gmpFVsQ5dL1bhH2PiaitKitfTeovGtDKXfdnbY/fQKBgQDcdVwaMZY0GOcXpXwR
/+p8Q3CSUNOQFfW1xFdqhJG3UgGSIyWgtGR3Sv2pMHVDmSPR1ne1klb6Do5ORXEU
jlHr1pZiuimEL5OG+k6ZNSgIX+1KzQetkvqv9MWb8eQZ4f0y2aL4I+/ql8ibNsYJ
RAXfHlcizU1JIVrt60DlADRM4A==
-----END PRIVATE KEY-----
EOF

cat > ~/.oci/oci_api_key_public.pem <<EOF
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5xKlcEYUJXk68u4iGz9t
HOKERvkFK70vSEpxkTvTE6tMGkPApUmr8BxZ2CpyNycGwz3Xd3ECLszFKtHGSSGH
g3ptRISGmgYCTcd6CRkuOF6BOYGWvEG4OmxQBHk/PAEVBivk7LOuBlDWrJnhP1VI
/krC4ZIWeYWILtH50M0Kmiy1e9tASJdzAz7d1vvcQ6JpWpUw3NcAVFQ9pibwSNSR
07y1Sgr5Im68p/q6LGNzNoDxUPDwtRGWzl1Tl9OurhhDI3eYDv2aS3g1Z63fyXd3
HtnBJIIyE9X/JNH0HaYIOpu9/RZQNZ1/RSQBEZwG5XlwzAkTUTTFF/MZxB62R7mv
VwIDAQAB
-----END PUBLIC KEY-----
EOF

echo 'INSTALLER: terraform'

dnf install -y terraform