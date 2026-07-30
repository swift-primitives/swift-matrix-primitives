// ===----------------------------------------------------------------------===//
//
// This source file is part of the swift-primitives open source project
//
// Copyright (c) 2024-2026 Coen ten Thije Boonkkamp and the swift-primitives project authors
// Licensed under Apache License v2.0
//
// See LICENSE for license information
//
// ===----------------------------------------------------------------------===//

import Testing

@testable import Matrix_Primitives

@Suite
struct MatrixTests {

    @Test
    func `Matrix namespace is an uninhabited enum`() {
        // Matrix is a caseless namespace enum; this smoke test pins the module
        // surface so the package's test leg has a live target.
        #expect(MemoryLayout<Matrix>.size == 0)
    }
}
