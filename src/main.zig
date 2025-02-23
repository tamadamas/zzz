const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("$ ", .{});

    const stdin = std.io.getStdIn().reader();
    var buffer: [1024]u8 = undefined;
    const user_input = try stdin.readUntilDelimiter(&buffer, '\n');

    var it = std.mem.split(u8, user_input, " ");
    const command = it.next().?;
    stdout.print("{s}: command not found\n", .{command}) catch {};


