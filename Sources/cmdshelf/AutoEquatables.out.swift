// Generated using Sourcery 0.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable file_length
fileprivate func compareOptionals<T>(lhs: T?, rhs: T?, compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    switch (lhs, rhs) {
    case let (lValue?, rValue?):
        return compare(lValue, rValue)
    case (nil, nil):
        return true
    default:
        return false
    }
}

fileprivate func compareArrays<T>(lhs: [T], rhs: [T], compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for (idx, lhsItem) in lhs.enumerated() {
        guard compare(lhsItem, rhs[idx]) else { return false }
    }

    return true
}

// MARK: - AutoEquatable for classes, protocols, structs
// MARK: - Blob AutoEquatable
extension Blob: Equatable {} 
internal func == (lhs: Blob, rhs: Blob) -> Bool {
    guard lhs.name == rhs.name else { return false }
    guard lhs.url == rhs.url else { return false }
    return true
}
// MARK: - Repository AutoEquatable
extension Repository: Equatable {} 
internal func == (lhs: Repository, rhs: Repository) -> Bool {
    guard lhs.name == rhs.name else { return false }
    guard lhs.url == rhs.url else { return false }
    guard compareOptionals(lhs: lhs.tag, rhs: rhs.tag, compare: ==) else { return false }
    guard compareOptionals(lhs: lhs.branch, rhs: rhs.branch, compare: ==) else { return false }
    return true
}

// MARK: - AutoEquatable for Enums

// MARK: -
