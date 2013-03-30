---
title: Control flow differences between Ruby Procs and Lambdas.
date: 2010-02-14 19:08 +05:30
tags:
---

One of the main differences between Procs and Lambdas in Ruby is how they work with `return` and `break`statements. The key to understanding this will make you opt for one control flow over the other.

#### Return

A `proc` `return` returns the control flow from their lexical scope. The lexical scope of a proc is the function in which its defined. Its determined statically when Ruby parses code.

Whereas a `lambda` `return` returns the control flow to its execution scope. This is just like a `return` from a method call. Control flow resumes to the line after the method call.


Example:

```ruby

describe "control flow" do
  class ReturnBehavior
    def self.call_proc
      proc { return "return-a" }.call
      "return-b"
    end

    def self.call_lambda
      lambda { return "return-a" }.call
      "return-b"
    end
  end

  it "shows procs return from their lexical scope" do
    ReturnBehavior.call_proc.should == "return-a"
  end

  it "shows lambdas return returns to their execution scope" do
    ReturnBehavior.call_lambda.should == "return-b"
  end
end
```

A `LocalJumpError` occurs when the lexical scope of a `proc` has already returned, and then the `proc` calls `return`.


For example below, the method `a_proc` builds and returns a `proc`. At the point the lexical scope has already returned, i.e. `a_proc` has already returned. Now when this returned `proc` is invoked via `call` (on line 11), it tries to return there is nothing to return out of, and hence the `LocalJumpError`

```ruby

describe "local jump errors " do
  class LocalJumpReturnBehavior
    def self.a_proc
      proc { return }
    end

    def self.a_lambda
      lambda { return }
    end
  end

  it "shows procs raise LocalJumpError when the lexical scope has already returned" do
    lambda { LocalJumpReturnBehavior.a_proc.call }.should raise_error(LocalJumpError)
  end

  it "shows lambdas do not raise LocalJumpError when the lexical scope has already returned" do
    lambda { LocalJumpReturnBehavior.a_lambda.call }.should_not raise_error(LocalJumpError)
  end
end

```


#### Break

The key difference here is that a `proc` needs an enclosing block to `break` out of, where as a `lambda` does not.

```ruby
 describe "break" do
 
   describe "local jump errors on break" do
 
     class LocalJumpBreakBehavior
       def self.a_proc
         proc { break }
       end
 
       def self.call_proc
         proc { loop { break } }.call
         "return-b"
       end
 
       def self.call_lambda
         lambda { break }.call
         "return-b"
       end
     end
 
     it "shows procs raise LocalJumpError when no enclosing block" do
       lambda { LocalJumpBreakBehavior.a_proc.call }.should raise_error(LocalJumpError)
     end
 
     it "shows procs break if in an enclosing block" do
       LocalJumpBreakBehavior.call_proc.should == "return-b"
     end
 
     it "shows lambdas break even if not in an enclosing block" do
       LocalJumpBreakBehavior.call_lambda.should == "return-b"
     end
   end
 
 end
```

#### Reads
* [Lexical and Dynamic Scoping](http://en.wikipedia.org/wiki/Scope_\(computer_science\)#Lexical_scoping_and_dynamic_scoping)
