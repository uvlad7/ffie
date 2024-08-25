import Rainbow

// public struct swiftie {
//     public private(set) var text = "Hello, World!"

//     public init() {
//     }
// }

@_cdecl("hello_swiftie")
public func mytype_create() -> Void {
    // print("Hello from ", "Swift".hex(0xfb4727), "!", separator: "")
    // print("Hello from ", "Swift".bit24(251,71,39), "!", separator: "")
    // print("Hello from ", "Swift".bit24(252,47,34), "!", separator: "")
    print("Hello from ", "Swift".bit24(248,116,50), "!", separator: "")
    // print("Hello from ", "Swift".applyingColor(.bit24((248,116,50))), "!", separator: "")
    // let entry = Rainbow.Entry(
    // segments: [
    //     .init(text: "Hello from "),
    //     .init(text: "Swift", color: .bit24((248,116,50))),
    //     .init(text: "!"),
    //     ]
    // )
    // print(Rainbow.generateString(for: entry))

    // print("Hello from Swift!")
}
