const std = @import("std");
const Build = std.Build;

pub fn build(b: *Build) !void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});
    const lsp_module = b.dependency("lsp-codegen", .{}).module("lsp");
    const exe = b.addExecutable(.{
        .root_source_file = b.path("src/main.zig"),
        .name = "foo",
        .target = target,
        .optimize = optimize,
    });

    exe.root_module.addImport("lsp", lsp_module);

    b.installArtifact(exe);

    const run = b.addRunArtifact(exe);
    const run_step = b.step("run", "run");
    run_step.dependOn(&run.step);
}
