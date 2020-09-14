# Weekly Assignments 7

### To be submitted: Tuesday, 22 September 2020, 12:30 MNG

Note that some tasks may deliberately ask you to look at concepts or libraries
that we have not yet discussed in detail. But if you are in doubt about the
scope of a task, by all means ask.

Please try to write high-quality code at all times!
This means in particular that you should add comments to all parts
that are not immediately obvious. Please also pay attention to
stylistic issues. The goal is always to submit code that does not
just correctly do what was asked for, but also could be committed
without further changes to an imaginary company codebase.

## W7.1 Static Analysis

We know that in Marlowe, it is not an error to reference a `ValueId`
that has not been set to a value.

Write a static analyzer

```
undefinedValueIds :: Contract -> Set ValueId
```

that statically detects such uninitialized `ValueId`s for a given contract.
