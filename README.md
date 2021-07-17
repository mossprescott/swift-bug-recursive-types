# RecursiveTypes

Minimal project reproducing a hang in the Swift 5.3 compiler.

A series of `typealias`es, each with a single parameter, is used to construct a deeply recursive type. As the size of the 
nested type increases, the compiler takes slightly longer to run. At a certain size (about 16 levels deep), the compiler
hangs indefinitely.

According to Activity monitor, `swift-frontend` is pegging a single core, with memory stable at about 35 MB.

```
$ time swift build  # declares, but does not apply, the Plus16 alias

[2/2] Build complete!

real    0m0.192s
user    0m0.119s
sys    0m0.041s

$ swift test -v   # tries to apply the alias to construct the compile-time value 16
...
/usr/bin/xcrun --sdk macosx --find xctest
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc -print-target-info
...
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-frontend -frontend -c -primary-file /Users/moss/git/RecursiveTypes/Tests/RecursiveTypesTests/RecursiveTypesTests.swift -emit-module-path /Users/moss/git/RecursiveTypes/.build/arm64-apple-macosx/debug/RecursiveTypesTests.build/RecursiveTypesTests~partial.swiftmodule -emit-module-doc-path /Users/moss/git/RecursiveTypes/.build/arm64-apple-macosx/debug/RecursiveTypesTests.build/RecursiveTypesTests~partial.swiftdoc -emit-module-source-info-path /Users/moss/git/RecursiveTypes/.build/arm64-apple-macosx/debug/RecursiveTypesTests.build/RecursiveTypesTests~partial.swiftsourceinfo -emit-dependencies-path /Users/moss/git/RecursiveTypes/.build/arm64-apple-macosx/debug/RecursiveTypesTests.build/RecursiveTypesTests.d -emit-reference-dependencies-path /Users/moss/git/RecursiveTypes/.build/arm64-apple-macosx/debug/RecursiveTypesTests.build/RecursiveTypesTests.swiftdeps -target arm64-apple-macosx10.15 -Xllvm -aarch64-use-tbi -enable-objc-interop -stack-check -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX11.3.sdk -I /Users/moss/git/RecursiveTypes/.build/arm64-apple-macosx/debug -I /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/lib -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks -color-diagnostics -enable-testing -g -module-cache-path /Users/moss/git/RecursiveTypes/.build/arm64-apple-macosx/debug/ModuleCache -swift-version 5 -Onone -D SWIFT_PACKAGE -D DEBUG -enable-anonymous-context-mangled-names -target-sdk-version 11.3 -parse-as-library -module-name RecursiveTypesTests -o /Users/moss/git/RecursiveTypes/.build/arm64-apple-macosx/debug/RecursiveTypesTests.build/RecursiveTypesTests.swift.o -index-store-path /Users/moss/git/RecursiveTypes/.build/arm64-apple-macosx/debug/index/store -index-system-modules
^C

$
```
