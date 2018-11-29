//: [Previous](@previous)

import Foundation

//#Arguments

//##Debugging Core Data

-com.apple.CoreData.ConcurrencyDebug 1
-com.apple.CoreData.SQLDebug 3
-com.apple.CoreData.MigrationDebug
-com.apple.CoreData.SyntaxColoredLogging 1
-com.apple.CoreData.SQLiteDebugSynchronous [0,1,2]
-com.apple.CoreData.SQLiteIntegrityCheck 1
-com.apple.CoreData.ThreadingDebug [1,2,3]

//## Debugging Localisation

-NSDoubleLocalizedStrings 1
-NSShowNonLocalizedStrings 1
-AppleLanguages (es de)

//Environement Variable:

//It gives you a clean log and will hide system messages from you
OS_ACTIVITY_MODE disable
// To enable or disable a Foundation debugging facility, you must set the value of the environment variable to "YES" or "NO", not 1 or 0 as is the case with other system components.
//If set to YES, deallocated objects are 'zombified'; this allows you to quickly debug problems where you send a message to an object that has already been freed.
NSZombieEnabled

//If set to YES, the memory for 'zombified' objects is actually freed.
NSDeallocateZombies

//Core Foundation supports an environment variable called CFZombieLevel. It interprets this variable as an integer containing a set of flag bits. These can help you track down various CF memory management issues.
//Currently defined bits:
//0 scribble deallocated CF memory
//1 when scribbling deallocated CF memory, don't scribble object header (CFRuntimeBase)
//4 never free memory used to hold CF objects
//7 if set, scribble deallocations using bits 8..15, otherwise use 0xFC
//8..15 if bit 7 is set, scribble deallocations using this value
//16 scribble allocated CF memory
//23 if set, scribble allocations using bits 24..31, otherwise use 0xCF
//24..31 if bit 23 is set, scribble allocations using this value
CFZombieLevel

// Fill allocated memory with 0xAA and scribble deallocated memory with 0x55.
MallocScribble

//Add guard pages before and after large allocations.
MallocGuardEdges

// Record backtraces for each memory block to assist memory debugging tools; if the block is allocated and then immediately freed, both entries are removed from the log, which helps reduce the size of the log.
MallocStackLogging

//Same as MallocStackLogging but keeps all log entries.
MallocStackLoggingNoCompact

//If set to YES, Foundation will use unbuffered I/O for stdout (stderr is unbuffered by default).
NSUnbufferedIO


##C++
//compile-time variable to enable debug mode in the standard C++ library. This item is not supported in GCC 4.2 or later, and you must not use it in that context.
_GLIBCXX_DEBUG

//set environment variable to 1 to disable memory caching in the standard C++ library. This allows you to debug your C++ allocations with the other memory debugging tools. In GCC 4.0 and later this is the default behavior.

GLIBCPP_FORCE_NEW

//: [Next](@next)
