import svg_to_dxf as std
import sys


if __name__ == "__main__":
    std.convert(
        svg_in="../examples/decadent_minimalist.svg",
        dxf_out=open("../examples_out/test.dxf", "w"))
