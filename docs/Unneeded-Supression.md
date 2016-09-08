## Introduction

_Unneeded Suppression_ is Reek's way of preventing you to disable unnecessary smells or linting your code.

## Example

Given this code:

```Ruby
class Smelly
  # :reek:UncommunicativeVariableName:
  def initialize
  end
end
```

Reek would emit the following warning:

```
test.rb -- 1 warning:
  [1]:UnneededSupression: Smelly#initialize has an unneeded suppression of UncommunicativeVariableName
```
## Current Support in Reek

Reek only counts the disable comments you use explicitly like in the example above.
