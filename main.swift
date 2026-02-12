import AppKit

final class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var counter = 0

    private let label: NSTextField = {
        let field = NSTextField(labelWithString: "Welcome to Swift on macOS")
        field.font = NSFont.systemFont(ofSize: 24, weight: .semibold)
        field.alignment = .center
        return field
    }()

    private let counterLabel: NSTextField = {
        let field = NSTextField(labelWithString: "Button taps: 0")
        field.font = NSFont.monospacedSystemFont(ofSize: 16, weight: .regular)
        field.alignment = .center
        return field
    }()

    private lazy var button: NSButton = {
        let b = NSButton(title: "Tap me", target: self, action: #selector(incrementCounter))
        b.bezelStyle = .rounded
        b.font = NSFont.systemFont(ofSize: 16, weight: .medium)
        return b
    }()

    func applicationDidFinishLaunching(_ notification: Notification) {
        let width: CGFloat = 480
        let height: CGFloat = 280

        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: width, height: height),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.center()
        window.title = "My First Mac App"
        window.makeKeyAndOrderFront(nil)

        guard let contentView = window.contentView else { return }

        let stack = NSStackView(views: [label, counterLabel, button])
        stack.orientation = .vertical
        stack.alignment = .centerX
        stack.distribution = .equalSpacing
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }

    @objc private func incrementCounter() {
        counter += 1
        counterLabel.stringValue = "Button taps: \(counter)"
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.setActivationPolicy(.regular)
app.activate(ignoringOtherApps: true)
app.run()
