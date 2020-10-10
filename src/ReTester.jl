"""
Set your `test/runtests.jl` file to be 
```
using Revise
using ReTester
includet(\"tests.jl\")
entr(run_tests(test), ["src"]; pause=0.2, all=true)
```
and create a `tests.jl` file with your real test function.
Your test will get run whenever you change a file. 
"""
module ReTester
using Test

export run_tests, @test, @testset

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

end # module
