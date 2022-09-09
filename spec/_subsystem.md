# _subsystem
  
  All Aurae subsystems require a formal definition. Write down a few sentences on what exactly this subsystem **will do**. 

  Try not to write down why it exists here, but rather what you plan on accomplishing with the subsystem itself. 
  For example, do not write "a subsystem that solve <thing>" but rather write "a subsystem that accomplishes <thing>".
  The justification will come later. 

### Scope
  
  All subsystems need to be carefully scoped. For example we do not want "schedule" functionality to leak into "runtime" functionality.
  What is in scope? What is out of scope? Why did you chose this scope?

### Dependencies 
  
  Does this subsystem depend on other subsystems? For example "schedule" depends on "runtime".
  What does this depend on? Do you see any other subsystems depending on this in the future?

### Justification
  
  Finally, why do you think this subsystem should exist? Write your justification for why you believe this would be a value add to the project here.

# gRPC Spec
  
```proto
  
syntax = "proto3";

package _subsystem;

import "meta.proto";

service LocalRuntime {

  rpc FuncA(FuncARequest) returns (FuncAResponse) {}
  rpc FuncB(FuncBRequest) returns (FuncBResponse) {}
  rpc FuncC(FuncCRequest) returns (FuncCResponse) {}
  
}
  
message FuncARequest {
  repeated meta.AuraeMeta meta = 1;
  // todo fields
}
  
message FuncBRequest {
  repeated meta.AuraeMeta meta = 1;
  // todo fields
}
  
message FuncCRequest {
  repeated meta.AuraeMeta meta = 1;
  // todo fields
}

message FuncAResponse {
  repeated meta.AuraeMeta meta = 1;
  // todo fields
}
  
message FuncBResponse {
  repeated meta.AuraeMeta meta = 1;
  // todo fields
}
  
message FuncCResponse {
  repeated meta.AuraeMeta meta = 1;
  // todo fields
}  
  
  
```
  
  
# Client Spec

  The client code is the wrapper and subsequent opinions that are baked into [aurae](https://github.com/aurae-runtime/aurae). These will be notably unique from the gRPC code itself.
  Every subsystem has an initialization function named after the subsystem itself. What will your initialization function be responsible for performing?

#### funcA(arg1)

  After the subsystem is authenticated and initialized without an error, what will your first function do? What non-variadric arguments will you pass to your function?

#### funcB(arg1, arg2)

  What will another function do? How will interact with your first function?

#### funcC() -> Type1

  What will your functions return? Where is this type defined?

#### struct Type1

```rust
#[derive(Debug, Clone)]
pub struct Type1 {
    pub field_name: String,
}

```

### Client Examples

```TypeScript

let aurae = connect();
subsys = aurae.subsystem();

subsys.funcA();
subsys.funcB();
subsys.funcC();


```
  
# Server Spec

Define as much [auraed](https://github.com/aurae-runtime/auraed) implementation detail as possible here.  
  
How will your subsystem be implemented in a generic way? What is the high level implementation detail for the daemon at runtime?
  
#### funcA()

  What will the daemon ([auraed](https://github.com/aurae-runtime/auraed)) need to manage this function?
  What will the daemon need to access in order to process this function?

#### funcB()

  What will another function do? How will interact with your first function?

#### funcC()

  Consider how many functions are accessing the same components within the daemon? If there are many functions referencing the same internals, its a sign that a function may be able to be consolidated.
  
  
