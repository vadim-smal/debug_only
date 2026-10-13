"""Splits the generated list by debug_only."""

load(":libs_list.gen.bzl", "ALL_LIBS")

DEFAULT_LIBS = [l.label for l in ALL_LIBS if not l.debug_only]
DEBUG_LIBS = [l.label for l in ALL_LIBS if l.debug_only]
