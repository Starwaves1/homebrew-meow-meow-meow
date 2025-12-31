# Quick Install Reference

## For End Users

Just run this one command:

```bash
brew install starwaves1/meow-meow-meow/meow-meow-meow
```

That's it! Then use:

```bash
meow meow meow meow
```

## For You (The Maintainer)

### Initial Setup (Do Once)

1. Create GitHub repo: `homebrew-meow-meow-meow`
2. Run setup script: `./setup.sh`
3. Push to GitHub:
   ```bash
   git init
   git add .
   git commit -m "Initial tap"
   git remote add origin https://github.com/Starwaves1/homebrew-meow-meow-meow.git
   git push -u origin main
   ```

### For Future Updates

1. Create new release/tag in your main repo
2. Update `url` and `version` in `Formula/meow-meow-meow.rb`
3. Run `./setup.sh` to update SHA256
4. Commit and push changes

### Test Locally Before Pushing

```bash
brew install --build-from-source ./Formula/meow-meow-meow.rb
brew test meow-meow-meow
brew audit --strict --online ./Formula/meow-meow-meow.rb
```

## Share With Users

Add this to your main repository's README:

```markdown
## Installation

Install with Homebrew in one command:

\`\`\`bash
brew install starwaves1/meow-meow-meow/meow-meow-meow
\`\`\`

Then use it:

\`\`\`bash
meow meow meow meow  # Prints four cats!
\`\`\`
```
