const std = @import("std");

const String = []const u8; // For less confusion. If this happens to be problematic, it will be changed. Feel free to rise an issue on the GH repo.
const Debug: bool = true;

const Token = struct {};
const Lexer = struct {
    string_before_parsing: String = "",
    //token_arraylist: std.ArrayList(Token),

    fn token_arraylist_from_string(self: *Lexer, string_input: String) void {
        self.string_before_parsing = string_input;
        if (Debug) std.debug.print("\nReceived following string: \"{s}\"\n\n", .{self.string_before_parsing});
        var buffer_slice_start: usize = 0;
        var buffer_slice_end: usize = 0;
        for (0..self.string_before_parsing.len) |i| {
            // std.debug.print("{c}, {d}, {}\n", .{ string_input[i], i, std.mem.eql(u8, string_input[i .. i + 1], " ") });
            if (std.mem.eql(u8, self.string_before_parsing[i .. i + 1], " ") or std.mem.eql(u8, self.string_before_parsing[i .. i + 1], "\n")) {
                // Found a whitespace
                if (buffer_slice_start != buffer_slice_end) {
                    std.debug.print("\"{s}\"\n", .{string_input[buffer_slice_start..buffer_slice_end]});
                }
                buffer_slice_end += 1;
                buffer_slice_start = buffer_slice_end;
            } else buffer_slice_end += 1;
        }
        if (buffer_slice_start != buffer_slice_end) {
            if (std.mem.eql(u8, self.string_before_parsing[self.string_before_parsing.len - 1 ..], ";")) buffer_slice_end -= 1;
            std.debug.print("\"{s}\"\n", .{self.string_before_parsing[buffer_slice_start..buffer_slice_end]});
        }
    }
};

pub fn main() !void {}

test "test whether a correct querry passes without any issues" {
    var lexer_1: Lexer = Lexer{};
    lexer_1.token_arraylist_from_string("FROM documents SELECT all;");
    lexer_1.token_arraylist_from_string(
        \\ FROM downloads
        \\ SELECT files
        \\ WHERE fileextention=.txt
    );
}
// test "simple test" {
//     var list = std.ArrayList(i32).init(std.testing.allocator);
//     defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
//     try list.append(42);
//     try std.testing.expectEqual(@as(i32, 42), list.pop());
// }
