import Foundation
import Reporter

let version = "0.9.4"

//
// - MARK: Setup
//
do {
    var env = ProcessInfo.processInfo.environment

    // Disable terminal prompts in git. This will make git error out and return
    // when it needs a user/pass etc instead of hanging the terminal (SR-3981).
    env["GIT_TERMINAL_PROMPT"] = "0"
}

//
// - MARK: Execution
//
let arguments = CommandLine.arguments.dropFirst().map { $0 }

func runHelpCommand(_ parser: ArgumentParser) {

    do {
        try HelpCommand.run(parser)
    } catch {
        queuedPrintlnError(error)
    }
}

let parser = ArgumentParser(args: arguments)

if arguments.isEmpty {

    // TODO: interactive mode
    runHelpCommand(parser)
    exit(0)
}

if let fst = arguments.first, ["-h", "--help"].contains(fst) {
    parser.shiftAll()
    runHelpCommand(parser)
    exit(0)
}

if let _version = arguments.first, _version == "--version" {
    queuedPrintln(version)
    exit(0)
}

do {
    let subCommand = try SubCommandArgument().parse(parser)

    switch subCommand {
    case .blob: try BlobCommand.run(parser)
    case .cat: try CatCommand.run(parser)
    case .list: try ListCommand.run(parser)
    case .remote: try RemoteCommand.run(parser)
    case .run: try RunCommand.run(parser)
    case .help: try HelpCommand.run(parser)
    case .update: try UpdateCommand.run(parser)
    }

} catch let error as CmdshelfError {
    if let msg = error.message {
        queuedPrintlnError(msg)
    }
    exit(1)

} catch {
    queuedPrintlnError(error)
    exit(1)
}
