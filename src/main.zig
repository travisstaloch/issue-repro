const std = @import("std");

const lsp = @import("lsp");

pub fn main() void {
    _ = lsp.types.DocumentSymbol;
}
