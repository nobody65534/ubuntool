#!/bin/bash

# Function to perform Chrome Safety Check
run_safety_check() {
    echo "Running Chrome Safety Check..."
    google-chrome-stable --safety-check-service
}

# Function to enable HTTPS-First mode in Chrome
enable_https_first_mode() {
    echo "Enabling HTTPS-First mode in Chrome..."
    google-chrome-stable --enable-features="HttpsFirst"
}

# Function to configure Secure DNS in Chrome
configure_secure_dns() {
    echo "Configuring Secure DNS in Chrome..."
    google-chrome-stable --force-fieldtrials="SecureDnsMode/Mode" --force-fieldtrial-params="SecureDnsMode.Mode:3"
}

# Run Chrome Safety Check
run_safety_check

# Enable HTTPS-First mode in Chrome
enable_https_first_mode

# Configure Secure DNS in Chrome
configure_secure_dns

echo "Security settings configured successfully."
