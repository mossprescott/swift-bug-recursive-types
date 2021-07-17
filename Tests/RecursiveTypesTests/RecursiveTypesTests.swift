    import XCTest
    @testable import RecursiveTypes

    final class RecursiveTypesTests: XCTestCase {
        /// These aliases all seem to be fine.
        func testNatSimpleAliases() {
            XCTAssertEqual(_0.intVal, 0)
            XCTAssertEqual(_1.intVal, 1)
            XCTAssertEqual(_2.intVal, 2)

            XCTAssertEqual(_64.intVal, 64)
        }

        func testNatBinaryAliases() {
            XCTAssertEqual(Plus2<One>.intVal, 3)
            XCTAssertEqual(Plus8<Plus2<One>>.intVal, 11)

            // The compiler hangs if this line is present:
            XCTAssertEqual(Plus16<Zero>.intVal, 16)

            // But this expression which constructs the same type seems to be fine:
            XCTAssertEqual(Plus8<Plus8<Zero>>.intVal, 16)
        }
    }
