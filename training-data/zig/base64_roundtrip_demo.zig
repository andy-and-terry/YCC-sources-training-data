const std = @import("std");

pub fn main() !void {
    const gpa = std.heap.page_allocator;
    const codec = std.base64.standard;
    const message = "Zig makes bytes visible";

    const enc_len = codec.Encoder.calcSize(message.len);
    const encoded = try gpa.alloc(u8, enc_len);
    defer gpa.free(encoded);
    _ = codec.Encoder.encode(encoded, message);
    std.debug.print("encoded: {s}\n", .{encoded});

    const dec_len = try codec.Decoder.calcSizeForSlice(encoded);
    const decoded = try gpa.alloc(u8, dec_len);
    defer gpa.free(decoded);
    try codec.Decoder.decode(decoded, encoded);
    std.debug.print("decoded: {s}\n", .{decoded});
    std.debug.print("roundtrip ok: {}\n", .{std.mem.eql(u8, message, decoded)});

    // Invalid input yields an error rather than garbage.
    const bad = codec.Decoder.calcSizeForSlice("not*valid!");
    std.debug.print("bad input is error: {}\n", .{std.meta.isError(bad)});
}
