#!/bin/bash

# Setup script for creating the Homebrew tap
# Run this script to finalize the formula with the correct SHA256 hash

set -e

echo "Setting up Homebrew tap for meow-meow-meow..."
echo ""

# Download the release tarball
echo "Downloading release tarball..."
curl -L -o /tmp/meow_meow.tar.gz https://github.com/Starwaves1/meow-meow-meow/archive/refs/tags/meow_meow.tar.gz

# Calculate SHA256
echo "Calculating SHA256 hash..."
SHA256=$(shasum -a 256 /tmp/meow_meow.tar.gz | awk '{print $1}')
echo "SHA256: $SHA256"

# Update the formula with the correct SHA256
echo "Updating formula..."
sed -i.bak "s/sha256 \"\"/sha256 \"$SHA256\"/" Formula/meow-meow-meow.rb
rm -f Formula/meow-meow-meow.rb.bak

# Clean up
rm /tmp/meow_meow.tar.gz

echo ""
echo "✅ Formula updated successfully!"
echo ""
echo "Next steps:"
echo "1. Review the formula in Formula/meow-meow-meow.rb"
echo "2. Test locally with: brew install --build-from-source ./Formula/meow-meow-meow.rb"
echo "3. Create a new GitHub repository named 'homebrew-meow-meow-meow'"
echo "4. Push this directory to that repository"
echo "5. Users can then install with: brew install starwaves1/meow-meow-meow/meow-meow-meow"
