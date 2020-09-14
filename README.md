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

that statically detects such uninitialized `ValueId`s for a given contract
and returns them as a set.

Note that if a `ValueId` has been initialized in one branch (like one branch
of an `If` or one `Case` of a `When`), but is used in another branch,
it should still be included in the list of results.

## W7.2 Crowd Sourcing Campaign

Write a function

```
crowd :: Amount   -- ^ campaign goal
      -> Amount   -- ^ individual contribution
      -> Role     -- ^ campaign owner
      -> [Role]   -- ^ contributors
      -> Slot     -- ^ deadline
      -> Contract
```

which create a Marlowe contract for a crowd-sourcing campaign.

In such a campaign, the campaign _owner_ sets a campaign _goal_ and
asks for contributions to his campaign. If the contributions exceed the goal
when the deadline is reached,
the campaign was successful, and the owner gets all contributed funds.

If on the other hand the contributed funds are lower than the goal,
the contributors get reimbursed once the deadline is reached.

In the function `crowd`, we use a fixed list of potential contributors
and a fixed amount that each contributor can contribute.
Contributors can contribute only once, and they should be able to contribute
at any time before the deadline (so they do not have to wait for other contributors
to make a contribution).

For example, if the goal is 1000 ada, the fixed individual contribution is 500 ada
and there are three contributors,
then there are four possible outcomes of the campaign:

- Nobody contributes. The campaign fails, and nothing happens.
- One contributor contributes 500 ada. The goal of 1000 ada has not been reached,
  the campaign fails, and the contributor gets her 500 ada back.
- Two contributors contribute 500 ada each. The goal of 1000 ada has been
  reached (just barely), the campaign was successful, and the campaign owner
  gets 1000 ada.
- All three contributors contribute. The goal has been exceeded,
  the campaign was successful, and the campaign owner gets 1500 ada.

Use the simulator to test your contract for at least the above example and those
four cases.
