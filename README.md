<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terraform AWS Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            color: #333;
        }
        h1, h2 {
            color: #0056b3;
        }
        pre {
            background-color: #f4f4f4;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }
        code {
            font-family: monospace;
            color: #d63384;
        }
        ul {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <h1>Terraform AWS Project</h1>
    <p>This repository contains Terraform configuration files to set up and manage infrastructure on AWS.</p>

    <h2>Prerequisites</h2>
    <p>Before running this project, ensure you have the following:</p>
    <ul>
        <li><strong>Terraform</strong> installed on your system. You can download it <a href="https://www.terraform.io/downloads.html" target="_blank">here</a>.</li>
        <li>An <strong>AWS account</strong> and access to credentials with sufficient permissions to create the required resources.</li>
        <li><strong>AWS CLI</strong> installed and configured. Follow the <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html" target="_blank">AWS CLI setup guide</a> if not already done.</li>
    </ul>

    <h2>Getting Started</h2>
    <p>Follow these steps to initialize and apply the Terraform configuration:</p>

    <h3>Step 1: Configure AWS Credentials</h3>
    <p>Run the following command to set up your AWS credentials:</p>
    <pre><code>aws configure</code></pre>
    <p>You will be prompted to enter your:</p>
    <ul>
        <li>AWS Access Key ID</li>
        <li>AWS Secret Access Key</li>
        <li>Default region</li>
        <li>Output format (e.g., <code>json</code>)</li>
    </ul>

    <h3>Step 2: Initialize Terraform</h3>
    <p>Initialize the Terraform working directory:</p>
    <pre><code>terraform init</code></pre>
    <p>This command downloads the required provider plugins and sets up your environment for Terraform usage.</p>

    <h3>Step 3: Validate Configuration</h3>
    <p>Validate the Terraform configuration files to ensure they are syntactically correct:</p>
    <pre><code>terraform validate</code></pre>

    <h3>Step 4: Apply the Configuration</h3>
    <p>Apply the Terraform configuration to create the infrastructure:</p>
    <pre><code>terraform apply</code></pre>
    <p>You will be prompted to review and confirm the changes before Terraform proceeds with provisioning.</p>

    <hr>

    <h2>Notes</h2>
    <ul>
        <li>To destroy the created infrastructure, use the following command:
            <pre><code>terraform destroy</code></pre>
        </li>
        <li>Always review the Terraform execution plan (<code>terraform plan</code>) before applying changes to ensure it aligns with your expectations.</li>
    </ul>

    <hr>

    <h2>Project Structure</h2>
    <ul>
        <li><code>main.tf</code>: Contains the primary Terraform configuration.</li>
        <li><code>variables.tf</code>: Defines the input variables for the project.</li>
        <li><code>outputs.tf</code>: Specifies the output values.</li>
        <li><code>providers.tf</code>: Configures the required providers (e.g., AWS).</li>
    </ul>

    <hr>

    <p>Feel free to clone, fork, or contribute to this repository. For any issues or questions, please open an issue in this repository.</p>
</body>
</html>
