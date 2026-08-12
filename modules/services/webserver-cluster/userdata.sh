#!/bin/bash

set -e

# Create the web page
cat <<EOF > /index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terraform Web Server</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #f5f5f5;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h1 {
            margin-bottom: 10px;
        }

        .info {
            padding: 15px;
            background: #f0f0f0;
            border-radius: 5px;
            margin-top: 20px;
        }

        .label {
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Hello from Terraform!</h1>

        <p>This web server was created using Terraform.</p>

        <div class="info">
            <p><span class="label">Database Address:</span> ${db_address}</p>
            <p><span class="label">Database Port:</span> ${db_port}</p>
            <p><span class="label">Web Server Port:</span> ${server_port}</p>
        </div>
    </div>
</body>
</html>
EOF

# Start BusyBox web server
nohup busybox httpd -f -p "${server_port}" > /var/log/httpd.log 2>&1 &