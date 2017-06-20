import Commander
import PathKit
import Foundation

class BlobCommand: Group {
    override init() {
        super.init()
        addCommand("list", "Show registered blobs.", Commander.command() {
            let config = try Configuration()
            queuedPrintln(config.cmdshelfYml.blobs.map { "\($0.name): \($0.url)" }.joined(separator: "\n"))
        })
        addCommand("add", "Add a script URL as a blob.", Commander.command(
            Argument<String>("NAME", description: "command name alias"),
            Argument<String>("URL", description: "script URL", validator: validURL)
        ) { (name, url) in
            let config = try Configuration()
            config.cmdshelfYml.blobs.append(Blob(name: name, url: url))
        })
        addCommand("remove", "Remove a blob.", Commander.command(
            Argument<String>("NAME", description: "command name")
            ) { name in
            let config = try Configuration()
            config.cmdshelfYml.removeBlob(name: name)
        })
    }
}
