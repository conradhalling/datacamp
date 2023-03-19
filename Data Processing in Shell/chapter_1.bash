#!/usr/bin/env bash
# Data Processing in Shell
# Chapter 1: Downloading Data on the Command Line
# Presented by Susan Sun, "Data Person".
set -euo pipefail

# Downloading data using curl
# curl is short for Client for URLs.
# curl --version
# curl 7.84.0 (x86_64-apple-darwin22.0) libcurl/7.84.0 (SecureTransport) LibreSSL/3.3.6 zlib/1.2.11 nghttp2/1.47.0
# Release-Date: 2022-06-27
# Protocols: dict file ftp ftps gopher gophers http https imap imaps ldap ldaps mqtt pop3 pop3s rtsp smb smbs smtp smtps telnet tftp
# Features: alt-svc AsynchDNS GSS-API HSTS HTTP2 HTTPS-proxy IPv6 Kerberos Largefile libz MultiSSL NTLM NTLM_WB SPNEGO SSL threadsafe UnixSockets
# curl is used to transfer data to and from a server.
# It is mostly used to download data from HTTP(S) sites and FTP servers.

# Example
# -O means write to an output file named as the remote file.
# curl -O https://websitename.com/datafilename.txt
# -o means specify the output file name.
# curl -o renameddatafilename.txt https://websitename.com/datafilename.txt

# Downloading multiple files using wildcards.
# https://websitename.com/datafilename001.txt ... 100.txt
# curl -O https://websitename.com/datafilename*.txt

# Downloading files with a globbing parser.
# curl -O https://websitename.com/datafilename[001-100].txt

# Every tenth file.
# curl -O https://websitename.com/datafilename[001-100:10].txt

# Preemptive troubleshooting
# Use man curl or curl --help to check options.
# Use these option flags in case of timeouts during download:
# -L redirects the HTTP URL if a 300 error code occurs.
# -C resumes a previous file transfer if it times out before completion.
# All option flags come before the URL, but their order does not matter.
# curl -L -O -C https://websitename.com/datafilename[001-100].txt

# Exercise.
curl -o Spotify201812.zip -L https://assets.datacamp.com/production/repositories/4180/datasets/eb1d6a36fa3039e4e00064797e1a1600d267b135/201812SpotifyData.zip
