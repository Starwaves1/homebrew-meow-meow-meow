# Step-by-Step Guide: Creating Your Homebrew Tap

This guide will walk you through setting up a Homebrew tap for meow-meow-meow so users can install it with one command.

## Prerequisites

- A GitHub account (you already have one: Starwaves1)
- Your meow-meow-meow repository with the `meow_meow` tag/release
- Git installed locally

## Step 1: Create the Tap Repository

1. Go to GitHub and create a new repository
2. **Important:** Name it `homebrew-meow-meow-meow` (the `homebrew-` prefix is required)
3. Make it public
4. Don't initialize with README (we'll push our own files)

## Step 2: Prepare the Tap Files Locally

You have three files ready in the `homebrew-meow-meow-meow` directory:
- `Formula/meow-meow-meow.rb` - The Homebrew formula
- `README.md` - Documentation for users
- `setup.sh` - Helper script to calculate SHA256

## Step 3: Calculate the SHA256 Hash

The formula needs the SHA256 hash of your release tarball. Run the setup script:

```bash
cd homebrew-meow-meow-meow
./setup.sh
```

This will:
- Download your release tarball
- Calculate its SHA256 hash
- Update the formula with the correct hash

## Step 4: Push to GitHub

Initialize and push the tap to GitHub:

```bash
cd homebrew-meow-meow-meow
git init
git add .
git commit -m "Initial commit: Homebrew tap for meow-meow-meow"
git branch -M main
git remote add origin https://github.com/Starwaves1/homebrew-meow-meow-meow.git
git push -u origin main
```

## Step 5: Test the Installation

Once pushed, test that it works:

```bash
brew install starwaves1/meow-meow-meow/meow-meow-meow
```

Or with tapping first:

```bash
brew tap starwaves1/meow-meow-meow
brew install meow-meow-meow
```

## Step 6: Update Your Main Repository

Add installation instructions to your main meow-meow-meow repository's README:

```markdown
## Installation

### Using Homebrew (macOS/Linux)

```bash
brew install starwaves1/meow-meow-meow/meow-meow-meow
```

### From Source

```bash
git clone https://github.com/Starwaves1/meow-meow-meow.git
cd meow-meow-meow
cargo install --path .
```
\```
```

## Troubleshooting

### Formula Audit
Before finalizing, you can audit your formula:

```bash
brew audit --strict --online Formula/meow-meow-meow.rb
```

### Local Testing
Test the formula locally before pushing:

```bash
brew install --build-from-source ./Formula/meow-meow-meow.rb
```

### Common Issues

1. **SHA256 mismatch**: Run `./setup.sh` again to recalculate
2. **Formula not found**: Make sure the repository is named `homebrew-meow-meow-meow`
3. **Build fails**: Check that all dependencies are listed in the formula

## Future Updates

When you release a new version:

1. Create a new tag/release on GitHub
2. Update the formula's `url` and `version` fields
3. Run `./setup.sh` to update the SHA256
4. Commit and push the changes

Homebrew users will get the update when they run `brew upgrade`.

## Advanced: Auto-updates

You can add a `livecheck` block to your formula to help Homebrew detect new versions:

```ruby
livecheck do
  url :stable
  strategy :github_latest
end
```

This will allow `brew livecheck meow-meow-meow` to check for new versions automatically.
