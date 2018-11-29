//: [Previous](@previous)

#General

with help you can get more informatiom to different options of lldb

#Attaching to a process

lldb /Projects/Sketch/build/Debug/Sketch.app
lldb -pid 52876
lldb --name DebuggingFun

// this is how you define a process to a attach to before it was started
process attach --name DebuggingFun --waitfor

#Setting a Breakpoint

b file:line
// with foo being a function
breakpoint set --name foo

//Symbolic Breakpoints with -n for function names (see symbolic breeakpoints Page)
e.g: br set -n viewDidLoad
//Error breakpoints
br set -E

//list of all set breakpoints
breakpoint list

//deleting a breakpoint
br delete 1

//you can also drop the <cmd-options> and add the command
breakpoint command add <cmd-options> <breakpt-id>
e.g:
br com add 2
Enter your debugger command(s). Type 'DONE' to end.
> bt
> continue
> DONE

//modifying a command
breakpoint modify -c "self == nil" -C bt --auto-continue 1


#Control
//step over
n
//step in
s
//continue
continue or c

#Other

//get a stacktrace
bt all

//changing values at runtime with po. Sometimes you have to cast addresses to the correct class
po backgroundView.backgroundColor = [UIColor redColor]

//getting an objects class
po [0x12345678 class]

// _recursiveDescriotion on UICiews can be used to get a description of all views
//

//: [Next](@next)
