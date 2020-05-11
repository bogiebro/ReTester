"""
Put your tests in a separate `Tests` package inside your main package.
Add your main package to your `Tests` package using `Pkg.dev`. 
Write a `runtests.jl` file in the main package directory like this:
```
using Revise
using ReTester
entr(run_tests(Tests.test), ["src", "Tests/src"]; pause=0.2)
```
To run tests, in the main directory, run 
`julia --project=Tests runtests.jl`
If you only want to run the tests named foo and bar, run
`julia --project=Tests runtests.jl foo bar`
"""
module ReTester
using Test

export run_tests, @do_test

function run_tests(test_f::Function)
  ()-> begin
    println("Running tests")
    try
      test_f()
    catch e
      println(e)
    end
    println("") 
  end
end

"Just like `@testset`, but allows you to filter out which tests get run
by passing them in `ARGS`"
macro do_test(name, block)
  return :((isempty(ARGS) || $name in ARGS) && @testset($name, $block))
end

# TODO: the test function is getting called multiple times
# TODO: do_test does not work
# TODO: add --debug flag support for calling `@enter f` instead of just `f`
# TODO: add a way to stop on the first error

end # module
