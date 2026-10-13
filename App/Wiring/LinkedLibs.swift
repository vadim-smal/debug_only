import LibA
import LibB
#if canImport(LibDebug)
import LibDebug
#endif

public enum LinkedLibs {
    public static var names: [String] {
        var all = [LibA.name, LibB.name]
        #if canImport(LibDebug)
        all.append(LibDebug.name)
        #endif
        return all
    }
}
