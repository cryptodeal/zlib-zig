const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib_zlib = b.addStaticLibrary(.{
        .name = "zlib",
        .target = target,
        .optimize = optimize,
    });
    lib_zlib.linkLibC();
    lib_zlib.addCSourceFiles(.{ .files = srcs, .flags = &.{"-std=c89"} });
    lib_zlib.addIncludePath(b.path("."));
    lib_zlib.installHeadersDirectory(b.path("."), "", .{});
    b.installArtifact(lib_zlib);
}

const srcs = &.{
    "adler32.c",
    "compress.c",
    "crc32.c",
    "deflate.c",
    "gzclose.c",
    "gzlib.c",
    "gzread.c",
    "gzwrite.c",
    "inflate.c",
    "infback.c",
    "inftrees.c",
    "inffast.c",
    "trees.c",
    "uncompr.c",
    "zutil.c",
};
