import XCTest
@testable import Voxprint_macOS

final class TranscriptionEntryTests: XCTestCase {
    func testFormattedDuration() {
        XCTAssertEqual(TranscriptionEntry(text: "", duration: 42, model: "m").formattedDuration, "42s")
        XCTAssertEqual(TranscriptionEntry(text: "", duration: 125, model: "m").formattedDuration, "2m 5s")
    }

    func testCodableRoundTrip() throws {
        let e = TranscriptionEntry(text: "hi", duration: 3, model: "tiny")
        let d = try JSONDecoder().decode(TranscriptionEntry.self, from: JSONEncoder().encode(e))
        XCTAssertEqual(d.id, e.id)
        XCTAssertEqual(d.text, "hi")
    }
}
