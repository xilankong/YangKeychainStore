import KeychainSwift

public struct YangKeychainStore {
    
    private static let keychain = KeychainSwift()
    
    private static let bundleID = "\(Bundle.main.infoDictionary?[kCFBundleIdentifierKey as String] as! String)"
    
}

public extension YangKeychainStore {
    
    static func set(_ value: String?, forKey key: String) {
        guard let str = value else { return }
        keychain.set(str, forKey: "\(bundleID).\(key)")
    }
    
    static func set(_ value: Data?, forKey key: String) {
        guard let data = value else { return }
        keychain.set(data, forKey: "\(bundleID).\(key)")
    }
    
    static func get(_ key: String) -> String? {
        return keychain.get("\(bundleID).\(key)")
    }
    
    static func getData(_ key: String) -> Data? {
        return keychain.getData("\(bundleID).\(key)")
    }
    
    static func delete(_ key: String) {
        keychain.delete("\(bundleID).\(key)")
    }
    
}
