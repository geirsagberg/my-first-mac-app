# My First Native Mac App (Swift, single executable)

This project is a minimal native macOS GUI app written in pure Swift + AppKit in a single source file:

- `main.swift`

The app opens a window with:

- A title label
- A button
- A tap counter

## One-time Xcode setup

If you have not configured full Xcode yet, run:

```bash
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
xcode-select -p
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch
```

Expected `xcode-select -p` output:

- `/Applications/Xcode.app/Contents/Developer`

If `/Applications/Xcode.app` does not exist, install Xcode from the App Store first.

## Build

```bash
./build.sh
```

Output binary:

- `.build/bin/MyFirstMacApp`

## Run

```bash
./run.sh
```

Or run the executable directly:

```bash
./.build/bin/MyFirstMacApp
```

## How this helps you learn Swift

- No Xcode project files required to understand the core app flow
- You can read all app logic in one place (`main.swift`)
- It demonstrates common Swift patterns: classes, properties, closures, `@objc` actions, and string interpolation
